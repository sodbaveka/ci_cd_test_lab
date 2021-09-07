FROM docker.io/library/nginx:latest

RUN apt update -y

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

RUN echo "Image created on $(date)" >> /usr/share/nginx/html/index.html
