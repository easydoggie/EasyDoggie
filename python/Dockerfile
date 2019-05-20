FROM python:3.7.3-alpine3.9
RUN pip install Flask==1.0.2
RUN adduser -D -g '' admin
USER admin
WORKDIR /app
COPY app /app
ENV FLASK_APP hello.py
CMD flask run --host=0.0.0.0
