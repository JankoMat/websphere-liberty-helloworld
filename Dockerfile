FROM websphere-liberty:19.0.0.5-kernel
#USER root

#RUN chown -R 1001:0 /config
#RUN apt update && apt --assume-yes install curl strace lsof tree

#COPY EnterpriseHelloWorld.ear /config/dropins
#COPY server.xml /config

#RUN chown -R 1001:0 /opt/ibm/wlp/usr/servers/defaultServer
#RUN chgrp -R 0 /config \
# && chmod -R g+rwX /config
 
#USER 1001


ENV WORKDIR="/usr/local/workdir" \
    WLP_DEBUG_ADDRESS="7777" \
    ENABLE_DEBUG="true"

USER 1001

COPY EnterpriseHelloWorld.ear /config/dropins
COPY server.xml /config
copy run $WORKDIR/run

USER root

RUN chown -R 1001:0 /config && \
    chmod -R g+rw /config && \
    chown -R 1001:0 /opt/ibm/wlp/usr/servers/defaultServer && \
    chmod -R g+rw /opt/ibm/wlp/usr/servers/defaultServer && \
    chown -R 1001:0 /opt/ibm/wlp/output && \
    chmod -R g+rw /opt/ibm/wlp/output && \
    chown -R 1001:0 /logs && \
    chmod -R g+rw /logs && \
    mkdir -p $WORKDIR/artifacts && \
    mkdir -p $WORKDIR/config && \
    chown -R 1001:0 $WORKDIR && \
    chmod -R g+rw $WORKDIR && \
    chown -R 1001:0 $WORKDIR/run && \
    chmod -R g+rwx $WORKDIR/run && \
    apt update && \
    apt --assume-yes install curl strace lsof tree 

USER 1001

WORKDIR $WORKDIR

EXPOSE $WLP_DEBUG_ADDRESS

CMD $WORKDIR/run
