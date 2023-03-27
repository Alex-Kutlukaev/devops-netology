FROM centos:7
WORKDIR /var/lib/elasticsearch
COPY elasticsearch-7.14.0 ./
RUN useradd -U elastic && \
chown elastic:elastic -R /var/lib/elasticsearch
USER elastic
CMD ["/bin/bash", "/var/lib/elasticsearch/bin/elasticsearch"]
