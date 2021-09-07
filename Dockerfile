FROM docker.io/library/nginx:latest

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

RUN apt update 

RUN sleep 5 && echo "Image created on $(date)" >> /usr/share/nginx/html/index.html

RUN sleep 5 && echo "Container created on $(echo $creation_date)" >> /usr/share/nginx/html/index.html