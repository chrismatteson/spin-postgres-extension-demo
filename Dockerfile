FROM postgres:15.3-alpine

RUN set -eux \
    && apk add --no-cache --virtual .fetch-deps \
        ca-certificates \
        openssl-dev \
        tar \
    \
    && wget -O http.tar.gz "https://github.com/chrismatteson/pgsql-http/archive/refs/tags/1.5.0.tar.gz" \
    && mkdir -p /usr/src/http \
    && tar \
        --extract \
        --file http.tar.gz \
        --directory /usr/src/http \
        --strip-components 1 \
    && rm http.tar.gz \
    \
    && apk add --no-cache --virtual .build-deps \
        \
        autoconf \
        automake \
        clang15-dev \
        file \
        g++ \
        gcc \
        gettext-dev \
        json-c-dev \
        libtool \
        libxml2-dev \
        llvm15-dev \
        make \
        pcre-dev \
        perl \
        curl-dev \
        protobuf-c-dev \
        libcurl \
    \
    && cd /usr/src/http \
    && make \
    && make install \
    \
    && cd / \
    && rm -rf /usr/src/http \
    && apk del .fetch-deps .build-deps \
    \
    && apk add libcurl
