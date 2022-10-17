ARG DOCKER_REGISTRY

FROM ${DOCKER_REGISTRY}/baseimage-sso:latest

# docker Agent Path : /software/ssoweb/SSO/webagent
# docker apache Path : /software/apache/servers/apache_svr1/conf

# [ BUILD ONLY local ]
#USER root
#RUN yum update --assumeyes --skip-broken && \
#      yum install --assumeyes telnet && \
#      yum clean all
#USER webwas

# WebAgent setting
RUN mkdir /software
RUN mkdir /software/ssoweb
RUN mkdir /software/ssoweb/SSO
COPY webagent /software/ssoweb/SSO/webagent

USER root

# Shell file
COPY rathon.sh /software/ssoweb/SSO/rathon.sh

RUN sed -i 's/^#LoadModule proxy_module modules/LoadModule proxy_module modules/g' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's/^#LoadModule proxy_http_module modules/LoadModule proxy_http_module modules/g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/ServerName www/a\ProxyPassReverse \/ http:\/\/apih-userportal\/' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/ServerName www/a\ProxyPass \/ http:\/\/apih-userportal\/' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/ServerName www/a\ProxyPreserveHost On' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/ServerName www/a\ProxyRequests Off' /usr/local/apache2/conf/httpd.conf

# Apache setting
RUN echo 'LoadModule sm_module "/software/ssoweb/SSO/webagent/bin/libmod_sm24.so"' >> /usr/local/apache2/conf/httpd.conf
RUN echo 'SmInitFile "/usr/local/apache2/conf/WebAgent.conf"' >> /usr/local/apache2/conf/httpd.conf
COPY apache/WebAgent.conf  /usr/local/apache2/conf/WebAgent.conf
COPY apache/AgentId.dat /usr/local/apache2/conf/AgentId.dat

ENV LD_LIBRARY_PATH /software/ssoweb/SSO/webagent/bin:software/ssoweb/SSO/webagent/bin/thirdparty:${LD_LIBRARY_PATH}
ENV PATH /software/ssoweb/SSO/webagent/bin:$PATH

RUN chmod 751 /software/ssoweb/SSO/rathon.sh
RUN chmod 755 /usr/local/apache2/conf/WebAgent.conf

WORKDIR /
CMD ["sh", "-c", "/software/ssoweb/SSO/rathon.sh"]
##CMD ["httpd-foreground"]
#CMD ["/bin/bash", "/software/apache/servers/apache_svr1/shl/start.sh"]
