ARG go_version
ARG contrib_version

FROM golang:${go_version} as build

RUN \
    sudo apt-get -qq update && \
    sudo apt-get install -qq -y git build-essential

WORKDIR /opentelemetry-collector-contrib
RUN git clone \
        --branch ${contrib_version} \
        https://github.com/open-telemetry/opentelemetry-collector-contrib.git .

RUN \
    go mod download && \
    make otelcontribcol