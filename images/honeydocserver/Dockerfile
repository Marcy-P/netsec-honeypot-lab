FROM nginx:latest
COPY images/honeydocserver/index.html /usr/share/nginx/html/index.html
COPY images/honeydocserver/image.png /usr/share/nginx/html/image.png

COPY images/honeydocserver/nginx.conf /etc/nginx/nginx.conf

# rn the sym link to the std output present in the nginx base image
RUN rm /var/log/nginx/*

# installing filebeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.1-amd64.deb
RUN dpkg -i filebeat-7.12.1-amd64.deb
COPY ./images/honeydocserver/filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod go-w /etc/filebeat/filebeat.yml

COPY ./images/honeydocserver/startup.sh /startup.sh
# if you add a custom CMD in the Dockerfile, be sure to include -g daemon off
ENTRYPOINT /bin/bash -x /startup.sh && nginx -g 'daemon off;'