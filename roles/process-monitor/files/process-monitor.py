from prometheus_client import start_http_server, Summary, Counter, Gauge
import time
import subprocess
import socket
import json
import requests
import threading
import sys


g_process = Gauge('process_is_running', 'check openshift component process is alive', ['host', 'ip', 'component'])
g_program = Gauge('program_is_running', 'check some program is alive', ['src_ip', 'src_host', 'program'])
threading_list = []


def get_func_name(func):
    def run():
        global threading_list
        a = func.__name__
        if a not in threading_list:
            threading_list.append(a)
        func()
    return run()


@get_func_name
def check_docker_status():
    try:
        subprocess.check_output('systemctl is-active docker', shell=True)
        subprocess.check_output('docker ps', shell=True)
        g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                         component='docker').set(1)
    except subprocess.CalledProcessError:
        g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                         component='docker').set(0)


@get_func_name
def check_ocpnode_status():
    try:
        subprocess.check_output('systemctl is-active origin-node', shell=True)
        g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                         component='origin-node').set(1)
    except subprocess.CalledProcessError:
            g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                             component='origin-node').set(0)


@get_func_name
def check_ocpmaster_status():
    if 'master' not in socket.gethostname():
        return
    else:
        try:
            subprocess.check_output('systemctl is-active origin-master-api', shell=True)
            g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                             component='origin-master-api').set(1)
        except subprocess.CalledProcessError:
            g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                             component='origin-master-api').set(0)

    if 'master' not in socket.gethostname():
        return
    else:
        try:
            subprocess.check_output('systemctl is-active origin-master-controllers', shell=True)
            g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                             component='origin-master-controllers').set(1)
        except:
            g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                             conponent='origin-master-controllers').set(0)


@get_func_name
def check_etcd_status():
    if 'master' not in socket.gethostname():
        return
    else:
        try:
            subprocess.check_output('systemctl is-active etcd', shell=True)
            health = subprocess.check_output('curl -s --cacert /etc/etcd/ca.crt --cert /etc/etcd/peer.crt --key /etc/etcd/peer.key https://%s:2379/health' % socket.gethostbyname(socket.getfqdn(socket.gethostname())), shell=True)
            if json.loads(health)['health'] == 'true':
                g_process.labels(host=socket.gethostname(),
                                 ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())), component='etcd').set(1)
        except:
            g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                             component='etcd').set(0)


@get_func_name
def check_dnsmasq_status():
    try:
        subprocess.check_output('systemctl is-active dnsmasq', shell=True)
        g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                         component='dnsmasq').set(1)
    except subprocess.CalledProcessError:
            g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                             component='dnsmasq').set(0)


@get_func_name
def check_ovs_status():
    try:
        subprocess.check_output('systemctl is-active openvswitch', shell=True)
        g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                         component='openvswitch').set(1)
    except subprocess.CalledProcessError:
            g_process.labels(host=socket.gethostname(), ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())),
                             component='openvswitch').set(0)


@get_func_name
def check_harbor_status():
    url = sys.argv[1]
    if 'http' not in url:
        url = 'http://'+url
    try:
        stats_code = requests.get(url).status_code
        if stats_code < 399:
            g_program.labels(src_host=socket.gethostname(),
                             src_ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())), program='harbor').set(1)
        else:
            g_program.labels(src_host=socket.gethostname(),
                             src_ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())), program='harbor').set(0)
    except Exception:
        g_program.labels(src_host=socket.gethostname(),
                         src_ip=socket.gethostbyname(socket.getfqdn(socket.gethostname())), program='harbor').set(0)


if __name__ == '__main__':
    start_http_server(9125)
    while True:
        for i in threading_list:
            proc = threading.Thread(target=globals()[i])
            proc.run()
        time.sleep(10)