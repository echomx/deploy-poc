# persistent, SELINUX disabled required
docker run -p 389:389  --env LDAP_ORGANISATION="HiCaaS" --env LDAP_DOMAIN="hicaas.com" --env LDAP_ADMIN_PASSWORD="Hi_CaaS_20180416" -v /ldap/config:/etc/ldap/slapd.d -v /ldap/data/:/var/lib/ldap  -v /etc/localtime:/etc/localtime:ro --detach docker.io/osixia/openldap:1.2.1 
sleep 8

