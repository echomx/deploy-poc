#!/usr/bin/python2.7
#
# yum install -y python-flask python-gunicorn python2-ruamel-yaml

import ast
from collections import OrderedDict
from flask import Flask
from flask import request
import os
import requests
import ruamel.yaml as yaml


app = Flask(__name__)


@app.route('/', defaults={'path': ''}, methods=['GET', 'POST'])
@app.route('/<path:path>', methods=['GET', 'POST'])
def process_node(path):
    def get_confs(conf):
        ret = {}
        if conf and os.path.exists(conf):
            with open(conf) as f:
                ret = yaml.load(f, yaml.RoundTripLoader, preserve_quotes=True)
        return ret

    def set_confs(conf, data):
        with open(conf, 'w+') as f:
            yaml.dump(data, f, Dumper=yaml.RoundTripDumper)

    def get_conf_file(path):
        return {
            'node': '/etc/origin/node/node-config.yaml',
            'master': '/etc/origin/master/master-config.yaml'}.get(path, '')

    method = request.method

    if path == 'nodemap':
        #data = ast.literal_eval(request.data)
        with open('/var/lib/tentacle.dat', 'w+') as f:
            f.write(request.data)
        return 'Nodes map updated'

    query_node = ''
    multi_query = False
    if '/' in path:
        path, query_node = path.split('/')
    elif path.endswith('s'):
        path = path[:-1]
        multi_query = True

    hostname = os.uname()[1]
    if not multi_query:
        if query_node == hostname:
            conf_file = get_conf_file(path)
            confs = get_confs(conf_file)
            if not confs:
                return 'Target config file not exists', 404

            if method == 'POST':
                data = ast.literal_eval(request.data)
                if path == 'master':
                    configuration = {}
                    for k in data:
                        if k in ('cpuRequestToLimitPercent', 'memoryRequestToLimitPercent'):
                            configration[k] = data[k]
                    if configuration:
                        configuration['apiVersion'] = 'v1'
                        confs['admissionConfig']['pluginConfig']['ClusterResourceOverride'] = configuration
                    if 'subdomain' in data:
                        confs['routingConfig']['subdomain'] = data['subdomain']
                    set_confs(conf_file, confs)
                    os.system('nohup systemctl restart origin-master-api origin-master-controllers &')
                    return 'Set master done'
                else:
                    for k in data:
                        if k in ('max-pods', 'kube-reserved', 'system-reserved'):
                            confs['kubeletArguments'][k] = data[k]
                    set_confs(conf_file, confs)
                    os.system('nohup systemctl restart origin-node &')
                    return 'Set node done'
            else:
                if path == 'master':
                    d = {
                        k: confs['admissionConfig']['pluginConfig'].get('ClusterResourceOverride', {}).get('configuration', {}).get(k)
                        for k in ('cpuRequestToLimitPercent', 'memoryRequestToLimitPercent')}
                    d['subdomain'] = confs['routingConfig']['subdomain']
                    d = str(d)
                else:
                    d = str({
                        k: confs['kubeletArguments'].get(k)
                        for k in ('kube-reserved', 'system-reserved', 'max-pods')})
                return d
        else:
            if method == 'POST':
                data = ast.literal_eval(request.data)
                endpoint = 'http://%(host)s:9696/%(path)s/%(host)s' % {'host': query_node, 'path': path}
                info = requests.post(endpoint, json=data)
                return "Node set done"
            else:
                endpoint = 'http://%(host)s:9696/%(path)s/%(host)s' % {'host': query_node, 'path': path}
                info = requests.get(endpoint).text.strip()
                return info
    elif multi_query:
        # This master will query confs, or set confs for all masters and nodes
        if not os.path.exists('/var/lib/tentacle.dat'):
            return 'Not nodemap post yet'
        nodemap = open('/var/lib/tentacle.dat').read()
        nodemap = ast.literal_eval(nodemap)
        if method == 'POST':
            data = ast.literal_eval(request.data)
            for member in nodemap[path]:
                endpoint = 'http://%(host)s:9696/%(path)s/%(host)s' % {'host': member, 'path': path}
                info = requests.post(endpoint, json=data)
            return "Nodes set done"
        else:
            all_info = {}
            for member in nodemap[path]:
                endpoint = 'http://%(host)s:9696/%(path)s/%(host)s' % {'host': member, 'path': path}
                info = requests.get(endpoint).text.strip()
                all_info[member] = ast.literal_eval(info)
            return str(all_info)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=9696)
