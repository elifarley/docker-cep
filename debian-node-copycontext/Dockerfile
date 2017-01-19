FROM elifarley/docker-cep:debian-slim-copycontext
MAINTAINER Elifarley Cruz <elifarley@gmail.com>
ENV BASE_IMAGE=docker-cep:debian-slim-copycontext

ONBUILD COPY . "$HOME"/
ONBUILD ENV BASE_IMAGE=elifarley/docker-cep:debian-node-copycontext \
NODE_VERSION="6.9.4" \
NPM_CONFIG_LOGLEVEL=info
ONBUILD RUN \
  xinstall save-image-info && \
  xinstall add-pkg xz-utils libkrb5-dev make gcc g++ python && \
  xinstall add node "$NODE_VERSION" && \
  npm --no-color install && \
  rm -rf "$HOME"/.npm && npm uninstall -g npm && \
  xinstall remove-pkg xz-utils libkrb5-dev make gcc g++ python && \
  xinstall cleanup && \
  chown -R "$_USER":nogroup "$HOME" && chmod -f +x "$HOME"/app.sh
