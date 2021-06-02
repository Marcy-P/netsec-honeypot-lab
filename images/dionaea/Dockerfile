FROM dinotools/dionaea

# installing filebeat
RUN apt-get update && \
    apt-get install -y \
    curl \
    nano \
    sqlite3 \
    build-essential

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.1-amd64.deb
RUN dpkg -i filebeat-7.12.1-amd64.deb
COPY ./images/dionaea/filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod go-w /etc/filebeat/filebeat.yml

COPY ./images/dionaea/entrypoint.sh /opt/dionaea/bin/entrypoint.sh
RUN chmod +x /opt/dionaea/bin/entrypoint.sh

COPY ./images/dionaea/readlogsqltree.py /opt/dionaea/readlogsqltree.py
RUN chmod +x /opt/dionaea/readlogsqltree.py

COPY ./images/dionaea/log_json.yaml /opt/dionaea/template/etc/dionaea/ihandlers-enabled/log_json.yaml
COPY ./images/dionaea/virustotal.yaml /opt/dionaea/template/etc/dionaea/ihandlers-enabled/virustotal.yaml

#COPY ./images/dionaea/tests /opt/dionaea/tests
#RUN chmod -R +x /opt/dionaea/tests

ENTRYPOINT ["/opt/dionaea/bin/entrypoint.sh"]
