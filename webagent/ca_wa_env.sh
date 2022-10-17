#!/bin/sh


NETE_WA_ROOT=/software/ssoweb/SSO/webagent
export NETE_WA_ROOT
NETE_WA_PATH=${NETE_WA_ROOT}/bin
export NETE_WA_PATH


CAPKIHOME=/software/ssoweb/SSO/webagent/CAPKI
export CAPKIHOME


LD_LIBRARY_PATH=/lib64:${NETE_WA_ROOT}/bin:${NETE_WA_ROOT}/bin/thirdparty:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH


PATH=${NETE_WA_PATH}:${PATH}
export PATH


#LD_PRELOAD=${NETE_WA_PATH}/libbtunicode.so
#uncomment the 'export' line below if the line above is uncommented.
#export LD_PRELOAD


