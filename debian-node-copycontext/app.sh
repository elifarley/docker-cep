#!/bin/sh
node --version && \
exec node "$HOME"/app.js "$@"
