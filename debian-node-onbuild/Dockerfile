FROM buildpack-deps:jessie
MAINTAINER Elifarley Cruz <elifarley@gmail.com>
ENV BASE_IMAGE=buildpack-deps:jessie

ARG TINI_VERSION='v0.13.2'
ARG GOSU_VERSION='1.10'
ARG NODE_VERSION=6.9.4
ARG NPM_CONFIG_LOGLEVEL=info

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

EXPOSE 8080

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
  xinstall add node "$NODE_VERSION" && \
  xinstall cleanup

COPY $_USER.sh $HOME/

ONBUILD COPY . "$HOME"/
ONBUILD ENV BASE_IMAGE=elifarley/docker-cep:debian-jdk-8
ONBUILD RUN \
  xinstall save-image-info && \
  npm --no-color install && \
  chown -R "$_USER":nogroup "$HOME" && chmod -f +x "$HOME"/app.sh
