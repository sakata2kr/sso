#!/bin/sh
#echo "/software/ssoweb/SSO/webagent/bin" > /etc/ld.so.conf.d/sso.conf
#ldconfig

# CA WebAgent ENV PATH (ca_wa_env.sh)
NETE_WA_ROOT=/software/ssoweb/SSO/webagent
export NETE_WA_ROOT
NETE_WA_RATH=${NETE_WA_ROOT}/bin
export NETE_WA_RATH

CAPKIHOME=/software/ssoweb/SSO/webagent/CAPKI
export CAPKIHOME

LD_LIBRARY_PATH=${NETE_WA_ROOT}/bin:${NETE_WA_ROOT}/bin/thirdparty:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH

PATH=${NETE_WA_RATH}:${PATH}
export PATH

#CA WebAgent smreghost
#export SSO_IP="172.31.228.31"
export SSO_HCO="skt_common_hco1"
export AGENT_TRUSTED_HOST=${HOSTNAME}
#export AGENT_SHAREDSECRET=

${NETE_WA_RATH}/smreghost -i ${SSO_IP} -u ${SSO_SMUSER} -p ${SSO_PASSWORD} -hn ${AGENT_TRUSTED_HOST} -hc ${SSO_HCO} -f ${NETE_WA_ROOT}/config/SmHost.conf

cd /software/ssoweb/SSO/webagent/config
#chown root:www-data SmHost.conf

chmod 777 SmHost.conf
#CA_WebAgent ENV
#. /software/ssoweb/SSO/webagent/ca_wa_env.sh

#Apache Service Start
/software/apache/servers/apache_svr1/shl/start.sh
