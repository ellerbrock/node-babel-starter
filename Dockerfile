
FROM frapsoft/alpine-unpriv

MAINTAINER Maik Ellerbrock (https://github.com/ellerbrock)

USER root

RUN apk add --update --no-cache nodejs && \
  npm update && \
  npm i -g yarn && \
  yarn self-update && \
  npm cache clean && \
  find /app/ -type d -name ".?*" -maxdepth 1 -exec rm -rf {} \; && \
  rm -rf /tmp/* /etc/apk/cache/*

USER app

ENV HOME=/app

WORKDIR $HOME

ENTRYPOINT ["node"]