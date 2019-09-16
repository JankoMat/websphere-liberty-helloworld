FROM websphere-liberty:19.0.0.5-kernel

COPY --chown=1001:0 EnterpriseHelloWorld.ear /config/dropins

RUN if [ ! -z $REPOSITORIES_PROPERTIES ]; then mkdir /opt/ibm/wlp/etc/ \
  && echo $REPOSITORIES_PROPERTIES > /opt/ibm/wlp/etc/repositories.properties; fi
