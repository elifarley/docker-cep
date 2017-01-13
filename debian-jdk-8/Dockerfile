FROM elifarley/docker-debian-jdk-8
MAINTAINER Elifarley <elifarley@gmail.com>
ENV BASE_IMAGE=elifarley/docker-debian-jdk-8

ARG APT_PACKAGES="rsync sudo"
ARG TINI_VERSION='v0.13.2'
ARG GOSU_VERSION='1.10'

ARG _USER=app
ARG HOME=/$_USER
ARG TZ=Brazil/East
ARG JAVA_TOOL_OPTIONS="-Duser.timezone=$TZ"
ARG TERM=xterm-256color

ENV \
  _USER="$_USER" \
  HOME="$HOME" \
  TZ="$TZ" \
  JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS" \
  TERM="$TERM"

ENTRYPOINT ["tini", "--", "entrypoint"]
# 'entrypoint' will run ~app/app.sh by default

WORKDIR $HOME

RUN curl -fsSL https://raw.githubusercontent.com/elifarley/cross-installer/master/install.sh | sh && \
  xinstall save-image-info && \
  xinstall add tini "$TINI_VERSION" && \
  xinstall add gosu "$GOSU_VERSION" && \
  xinstall add entrypoint && \
  xinstall add-user "$_USER" && \
  xinstall add timezone && \
  xinstall add-pkg && \
  xinstall add tar && \
  xinstall cleanup

ONBUILD ENV BASE_IMAGE=elifarley/docker-cep:debian-jdk-8
ONBUILD RUN \
xinstall save-image-info
