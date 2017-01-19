FROM debian:jessie-slim
MAINTAINER Elifarley Cruz <elifarley@gmail.com>
ENV BASE_IMAGE=debian:jessie-slim

ARG TINI_VERSION='v0.13.2'
ARG GOSU_VERSION='1.10'

ARG _USER=app
ARG HOME=/$_USER
ARG LANG=en_US.UTF-8
ARG TZ=Brazil/East
ARG JAVA_TOOL_OPTIONS="-Duser.timezone=$TZ"
ARG TERM=xterm-256color

ENV \
  _USER="$_USER" \
  HOME="$HOME" \
  LANG="$LANG" \
  TZ="$TZ" \
  JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS" \
  TERM="$TERM"

ENTRYPOINT ["tini", "--", "entrypoint"]
# 'entrypoint' will run ~app/app.sh by default

WORKDIR $HOME

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl && \
  curl -fsSL https://raw.githubusercontent.com/elifarley/cross-installer/master/install.sh | sh && \
  xinstall save-image-info && \
  xinstall add tini "$TINI_VERSION" && \
  xinstall add gosu "$GOSU_VERSION" && \
  xinstall add entrypoint && \
  xinstall add-user "$_USER" && \
  xinstall add timezone && \
  xinstall cleanup

ONBUILD COPY . "$HOME"/
ONBUILD ENV BASE_IMAGE=elifarley/docker-cep:debian-slim-copycontext
ONBUILD EXPOSE 8080
ONBUILD RUN \
  xinstall save-image-info
