FROM ubuntu:18.04

RUN set -x \
	&& apt update \
	&& apt install --no-install-recommends --no-install-suggests -y curl gnupg1 apt-transport-https ca-certificates \
	&& curl -O https://nginx.org/keys/nginx_signing.key \
	&& apt-key add nginx_signing.key \
	&& echo "deb https://packages.nginx.org/unit/ubuntu/ bionic unit" >> /etc/apt/sources.list.d/unit.list \
	&& echo "deb-src https://packages.nginx.org/unit/ubuntu/ bionic unit" >> /etc/apt/sources.list.d/unit.list \
	&& apt update \
	&& apt install --no-install-recommends --no-install-suggests -y unit unit-php php7.2-mysql \
	&& rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/unit.list
	
RUN set -x \
	&& ln -sf /dev/stdout /var/log/unit.log

STOPSIGNAL SIGTERM

CMD ["unitd", "--no-daemon", "--control", "unix:/var/run/control.unit.sock"]