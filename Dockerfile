FROM docker.io/library/nginx:latest

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

ARG creation_date

ENV creation_date=${creation_date}

RUN echo "Image created on $(date)" >> /usr/share/nginx/html/index.html

RUN echo "Container created on ${creation_date}" >> /usr/share/nginx/html/index.html