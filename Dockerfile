FROM websphere-liberty:19.0.0.5-kernel
USER root

COPY  EnterpriseHelloWorld.ear /config/dropins
COPY server.xml /config

RUN chown -R 1001:0 /config
RUN apt update && apt --assume-yes install curl strace lsof tree

USER 1001
