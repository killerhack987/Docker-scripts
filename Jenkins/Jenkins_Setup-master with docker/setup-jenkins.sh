#!/bin/bash

docker rm -f jenkins-docker
docker container run -u 0 --name jenkins-docker --rm -d \
  --privileged --network jenkins --network-alias docker \
  -e DOCKER_TLS_CERTDIR=/certs \
  -v /opt/jenkins/jenkins-docker-certs:/certs/client \
  -v /opt/jenkins/jenkins-data:/var/jenkins_home \
  -p 2375:2376 docker:dind
  
docker rm -f jenkins
docker container run -u 0 --name jenkins --rm -d \
  --network jenkins -e DOCKER_HOST=tcp://docker:2376 \
  -e DOCKER_CERT_PATH=/certs/client -e DOCKER_TLS_VERIFY=1 \
  -v /opt/jenkins/jenkins-data:/var/jenkins_home \
  -v /opt/jenkins/jenkins-docker-certs:/certs/client:ro \
  -p 8080:8080 -p 50000:50000 jenkinsci/blueocean
