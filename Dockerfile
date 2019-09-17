FROM ibmcom/websphere-traditional:8.5.5.14-profile

USER root

ENV ENABLE_BASIC_LOGGING=true

COPY io.openliberty.guides.multimodes.ear /work/app/

RUN chown -R was:root  /work/app/ && \
    chmod -R g+rw /work/app/
   
EXPOSE 9080 9443
