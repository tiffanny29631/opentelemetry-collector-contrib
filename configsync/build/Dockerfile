FROM google-go.pkg.dev/golang:1.24.1 AS builder

WORKDIR /otelcontribcol
COPY . .

RUN cd cmd/otelcontribcol && \
    GO111MODULE=on CGO_ENABLED=0 GOOS="linux" GOARCH="amd64" \
    go build -trimpath -buildvcs=false -o /out/otelcontribcol ./

FROM gcr.io/distroless/static:nonroot
COPY --from=builder /out/otelcontribcol /otelcontribcol
EXPOSE 13133 55678
ENTRYPOINT ["/otelcontribcol"]
CMD ["--config", "/etc/otel/config.yaml"]