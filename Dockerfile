FROM centos:6

WORKDIR /build
COPY . .

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install \
  --setopt=deltarpm=0 \
  --setopt=install_weak_deps=false \
  --setopt=tsflags=nodocs \
  rpm-libs \
  redhat-rpm-config \
  gcc \
  python-devel \
  /usr/bin/python2.6 \
  /usr/bin/git \
  /usr/bin/yumdownloader \
  /usr/bin/cpio \
  && yum clean all
# The version is Python 2.6.6
RUN python2.6 --version

RUN ./install_python2.6.sh

CMD ["bash"]
