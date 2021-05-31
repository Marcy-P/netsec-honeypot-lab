FROM dinotools/dionaea

# installing filebeat
RUN apt-get update && \
    apt-get install -y \
    curl

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.1-amd64.deb
RUN dpkg -i filebeat-7.12.1-amd64.deb
COPY ./images/honeydocserver/filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod go-w /etc/filebeat/filebeat.yml

ENTRYPOINT service filebeat start && /bin/bash