FROM docker.io/library/nginx:latest

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

RUN echo "Image créée le $DATE" >> /usr/share/nginx/html/index.html