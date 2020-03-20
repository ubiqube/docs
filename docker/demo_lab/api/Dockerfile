FROM ubiqube/msa2:api-20.0

RUN service wildfly restart
RUN service tomcat restart
RUN service ubi-sms restart

COPY create_tenant_customer.sh /usr/bin/

CMD [ "/sbin/init" ]

RUN chmod a+x  /usr/bin/create_tenant_customer.sh
#RUN check_services_status.sh
#RUN /usr/bin/create_tenant_customer.sh
