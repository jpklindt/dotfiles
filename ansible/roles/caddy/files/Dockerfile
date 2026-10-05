FROM docker.io/caddy:2.11.6-builder-alpine AS builder

# renovate: datasource=go depName=github.com/caddy-dns/porkbun
ARG PORKBUN_VERSION=v0.3.1
RUN xcaddy build \
  --with github.com/caddy-dns/porkbun@${PORKBUN_VERSION}

FROM docker.io/caddy:2.11.6-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
