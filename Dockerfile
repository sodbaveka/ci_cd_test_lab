FROM docker.io/library/nginx:latest

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

ARG creation_date=00-00-0000

ENV creation=$creation_date

RUN echo "Image created on $(date)" >> /usr/share/nginx/html/index.html

RUN echo "Container created on $creation" >> /usr/share/nginx/html/index.html