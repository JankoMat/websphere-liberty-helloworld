FROM ibmcom/websphere-traditional:8.5.5.14-profile

USER root

ENV ENABLE_BASIC_LOGGING=true

COPY io.openliberty.guides.multimodes.ear /work/app/

RUN chown -R was:root  /work/app && \
    chmod -R g+rw /work/app && \
    chown -R was:root  /work && \
    chmod -R g+rw /work && \
    wsadmin.sh -lang jython -conntype NONE -c "AdminApp.install('/work/app/io.openliberty.guides.multimodes.ear', '[-appname io.openliberty.guides -contextroot /converter]')" && \
    /work/configure.sh
   
EXPOSE 9080 9443
