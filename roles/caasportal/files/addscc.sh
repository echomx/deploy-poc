oc patch scc privileged -p '{"priority": 22}'
oc adm policy add-scc-to-user privileged system:serviceaccount:caasportal:default
