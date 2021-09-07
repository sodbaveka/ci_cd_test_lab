FROM docker.io/library/nginx:latest

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

ENV creation_date="blue"

RUN echo "Image created on $(date)" >> /usr/share/nginx/html/index.html

RUN echo "Container created on $creation_date" >> /usr/share/nginx/html/index.html