FROM docker.io/library/nginx:latest

ENV creation_date='blue'

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

RUN echo "Image created on $(date)" >> /usr/share/nginx/html/index.html \

&& echo "Container created on $creation_date" >> /usr/share/nginx/html/index.html