FROM nginx/unit:1.8.0-python3.5

RUN ["mkdir", "-p", "/var/www/test/app"]

COPY unit.conf.json /tmp/
COPY run.sh /tmp/run.sh
COPY app/ /var/www/test/app/

CMD /tmp/run.sh
