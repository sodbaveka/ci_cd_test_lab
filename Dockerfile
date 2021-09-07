FROM docker.io/library/ubuntu:latest

RUN apt update -y && apt install nginx -y

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

RUN echo "Image created on $(date)" >> /usr/share/nginx/html/index.html
RUN systemctl enable nginx && systemctl start nginx

CMD echo "Container created on $creation_date" >> /usr/share/nginx/html/index.html
