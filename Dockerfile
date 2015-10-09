FROM pulsepointinc/centos6-python27

CMD [ "luigid" ]

RUN mkdir /etc/luigi
ADD client.cfg /etc/luigi/client.cfg

RUN \
  conda install -y pip && \
  pip install \
    'luigi==1.3.0' \
    'SQLAlchemy==1.0.8'
