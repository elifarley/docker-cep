FROM ubuntu:14.04
MAINTAINER elifarley@gmail.com
ENV \
  BASE_IMAGE=ubuntu:16.04

ARG APK_PACKAGES="nginx"
ARG TINI_VERSION='v0.5.0'
ARG GOSU_VERSION='1.6'

ARG _USER=app
ARG HOME=/$_USER
ARG TZ=Brazil/East

ENV \
  CEP_LOG_FILES=/var/log/nginx/access.log:out,/var/log/nginx/error.log:err \
  _USER="$_USER" \
  HOME="$HOME" \
  TZ="$TZ"

EXPOSE 80

ENTRYPOINT ["tini", "--", "entrypoint"]
CMD ["nginx"]

RUN \
  echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" > /etc/apt/sources.list.d/nginx-stable-trusty.list && \
  echo "deb-src http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" >> /etc/apt/sources.list.d/nginx-stable-trusty.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C && \
  apt-get update -y && apt-get install -y ca-certificates curl && \
  curl -fsSL https://raw.githubusercontent.com/elifarley/cross-installer/master/install.sh | sh && \
  xinstall save-image-info && \
  xinstall add tini "$TINI_VERSION" && \
  xinstall add gosu "$GOSU_VERSION" && \
  xinstall add entrypoint && \
  xinstall add-user "$_USER" && \
  xinstall add timezone && \
  xinstall add-pkg && \
  xinstall cleanup && \
  xinstall meta remove

RUN \
  mkdir -p /var/log/nginx /etc/nginx && echo "daemon off;" >> /etc/nginx/nginx.conf

ADD default /etc/nginx/sites-available/default
