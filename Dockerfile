FROM docker.io/library/nginx:latest

RUN cp /var/lib/jenkins/workspace/jenkins_on_aws_test_lab_main/artefacts/index.html /usr/share/nginx/html/index.html

EXPOSE 8234