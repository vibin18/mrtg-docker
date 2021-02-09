FROM arm32v7/alpine:3.7

ENV TZ "UTC"
ENV HOSTS "public:localhost"

RUN apk add --update --no-cache tzdata net-snmp-tools mrtg dcron nginx \
    && mkdir -p /etc/mrtg/conf.d

ADD files/mrtg.sh /usr/sbin/mrtg.sh
ADD files/mrtg.cron /etc/crontabs/root
ADD files/nginx.conf /etc/nginx/nginx.conf
ADD files/mrtg.cfg /etc/mrtg/mrtg.cfg

CMD ["/usr/sbin/mrtg.sh"]

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="MRTG" \
      org.label-schema.description="Multi Router Traffic Grapher." \
      org.label-schema.schema-version="1.0" \