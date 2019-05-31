FROM nginx/unit:1.8.0-php7.0

RUN set -x \
    && apt update \
    && apt install --no-install-recommends --no-install-suggests -y lsb-release apt-transport-https ca-certificates \
    && curl -o /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.3.list \
    && apt remove --purge --auto-remove -y php-common \
    && apt update \
    && apt install --no-install-recommends --no-install-suggests -y php7.3 php7.3-curl  php7.3-mbstring php7.3-mysql \
	&& apt remove --purge --auto-remove -y lsb-release apt-transport-https \
	&& rm -rf /var/lib/apt/lists/* 

CMD ["unitd", "--no-daemon", "--control", "unix:/var/run/control.unit.sock"]