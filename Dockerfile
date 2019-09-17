FROM ibmcom/websphere-traditional:8.5.5.14-profile

USER root

ENV ENABLE_BASIC_LOGGING=true

COPY sample.war /work/app/

RUN chown -R was:root  /work/app/ && \
    chmod -R g+rw /work/app/ && \
    wsadmin.sh -lang jython -conntype NONE -c "AdminApp.install('/work/app/HPB.FrontOffice.Pack.ear', '[-appname HPB.FrontOffice.Pack -contextroot /HPB.FrontOffice.Web]')" && \
    /work/configure.sh
   
EXPOSE 9080 9443
