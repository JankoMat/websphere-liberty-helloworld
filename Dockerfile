FROM websphere-liberty:19.0.0.5-kernel
USER root

#RUN chown -R 1001:0 /config
RUN apt update && apt --assume-yes install curl strace lsof tree

COPY EnterpriseHelloWorld.ear /config/dropins
COPY server.xml /config

RUN chown -R 1001:0 /opt/ibm/wlp/usr/servers/defaultServer
RUN chgrp -R 0 /config \
 && chmod -R g+rwX /config
 
USER 1001

RUN installUtility install --acceptLicense defaultServer
