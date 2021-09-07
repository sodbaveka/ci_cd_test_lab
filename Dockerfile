FROM docker.io/library/nginx:latest

ENV creation_date='blue'

ARG test=$creation_dateR

COPY ./artefacts/index.html /usr/share/nginx/html/index.html

RUN echo "Image created on $(date)" >> /usr/share/nginx/html/index.html \

&& echo "Container created on $test" >> /usr/share/nginx/html/index.html