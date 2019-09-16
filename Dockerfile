FROM websphere-liberty:19.0.0.5-kernel
USER root

COPY  EnterpriseHelloWorld.ear /config/dropins
COPY server.xml /config/

RUN chown -R 1001:0 /config
RUN if [ ! -z $REPOSITORIES_PROPERTIES ]; then mkdir /opt/ibm/wlp/etc/ \
  && echo $REPOSITORIES_PROPERTIES > /opt/ibm/wlp/etc/repositories.properties; fi
RUN apt update && apt install curl strace lsof tree

USER 1001
