FROM websphere-liberty:19.0.0.5-kernel
USER root

#RUN chown -R 1001:0 /config
RUN apt update && apt --assume-yes install curl strace lsof tree

RUN su 1001
COPY  EnterpriseHelloWorld.ear /opt/ibm/wlp/usr/servers/defaultServer/dropins
COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/configDropins/overrides
