FROM golang:1.23 as builder
RUN go install github.com/development-and-dinosaurs/paleoplay@v0.0.1

FROM mcr.microsoft.com/playwright:v1.47.2-noble
COPY --from=builder /go/bin/paleoplay /
RUN apt-get update && -y ca-certificates tzdata \
    && rm -rf /var/lib/apt/lists/*

COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
