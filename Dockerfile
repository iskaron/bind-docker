FROM debian
MAINTAINER Iskaron <mail@iskaron.de>

ENV DATA_DIR=/data \
	BIND_USER=bind

RUN apt-get update && apt-get install -y bind9 dnsutils && rm -rf /var/lib/apt/lists/*

EXPOSE 53/udp 53/tcp

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

VOLUME ["${DATA_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/sbin/named"]
