FROM websphere-liberty:19.0.0.5-kernel

COPY  EnterpriseHelloWorld.ear /config/dropins

RUN chown -R 1001:0 /config/dropins
RUN if [ ! -z $REPOSITORIES_PROPERTIES ]; then mkdir /opt/ibm/wlp/etc/ \
  && echo $REPOSITORIES_PROPERTIES > /opt/ibm/wlp/etc/repositories.properties; fi
