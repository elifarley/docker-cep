FROM elifarley/docker-cep:alpine
MAINTAINER Elifarley Cruz <elifarley@gmail.com>

ONBUILD ENV BASE_IMAGE=docker-cep:alpine-copycontext
ONBUILD COPY . "$HOME"/
ONBUILD RUN \
  xinstall save-image-info && \
  chmod +x "$HOME"/*app*.sh && chown "$_USER":"$_USER" "$HOME"/*app.sh
