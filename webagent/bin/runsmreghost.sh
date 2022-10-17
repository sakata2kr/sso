#!/bin/sh
LD_LIBRARY_PATH=/appsw/ssoweb/SSO/webagent/bin
SHLIB_PATH=/appsw/ssoweb/SSO/webagent/bin
LIBPATH=/appsw/ssoweb/SSO/webagent/bin
CAPKIHOME=/appsw/ssoweb/SSO/webagent/CAPKI
export LD_LIBRARY_PATH SHLIB_PATH LIBPATH CAPKIHOME
"/appsw/ssoweb/SSO/webagent/bin/smreghost" -i 172.31.228.31 -u "siteminder" -p -hn "skt_swgssos_trustedhost1" -hc "skt_common_hco1" -cf "COMPAT" -f "/appsw/ssoweb/SSO/webagent/config/SmHost.conf" 
rc=$?
returnValue()
{
  return $rc
}
returnValue
