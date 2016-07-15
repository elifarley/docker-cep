FROM alpine:3.4
MAINTAINER Elifarley <elifarley@gmail.com>
ENV BASE_IMAGE=alpine:3.4

ARG APK_PACKAGES="rsync sudo shadow bash"
ARG GOSU_VERSION='1.5'
ARG TINI_VERSION='v0.5.0'

ARG _USER=app
ARG HOME=/$_USER
ARG TZ=Brazil/East
ARG TERM=xterm-256color

ENV \
  _USER="$_USER" \
  HOME="$HOME" \
  TZ="$TZ" \
  TERM="$TERM"

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/entrypoint"]
# 'entrypoint' will run $HOME/app.sh by default

WORKDIR $HOME

RUN curl -fsSL https://raw.githubusercontent.com/elifarley/cross-installer/master/install.sh | sh && \
  xinstall save-image-info && \
  xinstall add gosu "$GOSU_VERSION" && \
  xinstall add tini "$TINI_VERSION" && \
  xinstall add entrypoint && \
  xinstall add-user "$_USER" && \
  xinstall add timezone && \
  xinstall add-pkg && \
  xinstall add tar && \
  xinstall cleanup

ONBUILD ENV BASE_IMAGE=elifarley/docker-cep:alpine
ONBUILD RUN \
  xinstall save-image-info
