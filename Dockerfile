FROM docker.io/library/ubuntu:latest

RUN apt update && apt install nginx

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

RUN echo "Image created on $(date)" >> /usr/share/nginx/html/index.html
RUN systemctl enable nginx && systemctl start nginx

CMD echo "Container created on $creation_date" >> /usr/share/nginx/html/index.html
