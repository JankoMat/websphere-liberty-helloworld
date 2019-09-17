FROM ibmcom/websphere-traditional:8.5.5.14-profile

USER root

ENV ENABLE_BASIC_LOGGING=true

COPY io.openliberty.guides.multimodes.ear /work/app/

RUN chown -R was:root  /work/app && \
    chmod -R g+rwX /work/app && \
    chown -R was:root  /work && \
    chmod -R g+rwX /work && \
    chown -R was:root  /opt/IBM/WebSphere/AppServer/profiles/AppSrv01 && \
    chmod -R g+rwX /opt/IBM/WebSphere/AppServer/profiles/AppSrv01
   
EXPOSE 9080 9443
