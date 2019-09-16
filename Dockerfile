FROM websphere-liberty:19.0.0.5-kernel

COPY EnterpriseHelloWorld.ear /config/dropins
COPY server.xml /config

USER root

RUN chown -R 1001:0 /config && \
    chmod -R g+rw /config && \
    chown -R 1001:0 /opt/ibm/wlp/usr/servers/defaultServer && \
    chmod -R g+rw /opt/ibm/wlp/usr/servers/defaultServer && \
    chown -R 1001:0 /opt/ibm/wlp/output && \
    chmod -R g+rw /opt/ibm/wlp/output && \
    chown -R 1001:0 /logs && \
    chmod -R g+rw /logs && \
    apt update && \
    apt --assume-yes install curl strace lsof tree

USER 1001
