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


ENV STI_SCRIPTS_PATH="/usr/local/s2i" \ 
    WORKDIR="/usr/local/workdir" \
    WLP_DEBUG_ADDRESS="7777" \
    ENABLE_DEBUG="false" \ 
    ENABLE_JOLOKIA="true" \
    S2I_DESTINATION="/tmp" 

# Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH
COPY ./s2i/bin/ $STI_SCRIPTS_PATH 

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
    ln $STI_SCRIPTS_PATH/assemble-runtime $STI_SCRIPTS_PATH/assemble && \
    apt update && \
    apt --assume-yes install curl strace lsof tree

USER 1001
COPY ./placeholder.txt $WORKDIR/artifacts 
COPY ./placeholder.txt $WORKDIR/config 

WORKDIR $WORKDIR

EXPOSE $WLP_DEBUG_ADDRESS

USER 1001

CMD ["$STI_SCRIPTS_PATH/run"]
