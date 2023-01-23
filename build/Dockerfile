ARG ARG_VERSION=1.11.0

FROM ghcr.io/jaime-project/jaime-front:${ARG_VERSION} as front
FROM ghcr.io/jaime-project/jaime-back:${ARG_VERSION}

RUN apt-get update
RUN apt-get install nginx gettext-base -y

COPY --from=front /etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=front /usr/share/nginx/html /usr/share/nginx/html
COPY --from=front /usr/share/nginx/html/assets/appconfig.env.json /usr/share/nginx/html/assets/appconfig.env.json

RUN chmod 777 /var/log/nginx/access.log >> /var/log/nginx/access.log
RUN chmod 777 /var/log/nginx/error.log >> /var/log/nginx/error.log
RUN chmod 777 /usr/share/nginx/html -R
RUN chmod 777 /var/lib/nginx/ -R

ARG ARG_VERSION=1.11.0
ENV VERSION=${ARG_VERSION}
ENV TZ=America/Argentina/Buenos_Aires

ENV PYTHON_HOST=0.0.0.0
ENV PYTHON_PORT=5000
ENV WORKINGDIR_PATH=/data/workingdir
ENV JAIME_URL http://0.0.0.0:5000

EXPOSE 80 5000

WORKDIR /home/jaime

CMD /bin/bash -c "service nginx stop && envsubst < /usr/share/nginx/html/assets/appconfig.env.json > /usr/share/nginx/html/assets/appconfig.json && nginx -g 'daemon off;' &python3 -m gunicorn -b ${PYTHON_HOST}:${PYTHON_PORT} --workers=1 --threads=6 app:app"
