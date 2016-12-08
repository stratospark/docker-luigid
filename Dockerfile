FROM python:3.5-alpine

RUN \
  pip install \
    'luigi==2.4.0' \
    'SQLAlchemy==1.1.4' && \
  rm -fr /root/.cache

CMD [ "/bin/start.sh" ]

COPY ./files/bin/start.sh /bin/start.sh

COPY ./files/etc/luigi/logging.conf /etc/luigi/logging.conf
