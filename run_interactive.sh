#!/bin/sh

docker build --rm -t rpm-py-installer-support-centos6 .
docker run -it rpm-py-installer-support-centos6
