FROM alpine:3.15

ENV USER=otel
ENV UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --no-create-home \
    --uid "$UID" \
    "$USER"


COPY --from=build --chown=otel --chmod=0700 /opentelemetry-collector-contrib/bin/otelcontribcol_linux_amd64 /otelcontribcol

ENTRYPOINT [ "/otelcontribcol" ]