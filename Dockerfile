FROM docker.io/library/nginx:latest

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

RUN apt update

RUN export var=$(echo $creation_date)

RUN echo "Image created on $(date)" >> /usr/share/nginx/html/index.html \

&& echo "Container created on $var" >> /usr/share/nginx/html/index.html