FROM centos:7

CMD [ "luigid" ]

EXPOSE 8082

RUN adduser luigi && mkdir -p /etc/luigi
ADD client.cfg /etc/luigi/client.cfg

RUN \
  curl -s -L -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
  python /tmp/get-pip.py && \
  pip install \
    'luigi==1.3.0' \
    'SQLAlchemy==1.0.9' && \
  rm -fr /tmp/*

USER luigi
