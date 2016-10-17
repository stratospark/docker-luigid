FROM python:2-alpine

CMD [ "luigid" ]

EXPOSE 8082

RUN \
  mkdir -p /etc/luigi && \
  pip install \
    'luigi==2.3.2' \
    'SQLAlchemy==1.1.1' && \
  rm -fr /root/.cache

COPY client.cfg /etc/luigi/client.cfg
