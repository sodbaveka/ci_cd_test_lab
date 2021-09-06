FROM docker.io/library/nginx:latest

RUN sudo cp /artefacts/index.html /usr/share/nginx/html/index.html

EXPOSE 8234