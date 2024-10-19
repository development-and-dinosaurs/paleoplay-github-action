FROM golang:1.23 as builder
RUN go install github.com/playwright-community/playwright-go/cmd/playwright@latest
RUN go install github.com/development-and-dinosaurs/paleoplay@v0.0.1

FROM ubuntu:jammy
COPY --from=builder /go/bin/playwright /go/bin/paleoplay /
RUN apt-get update && apt-get install -y ca-certificates tzdata \
    && /playwright install --with-deps chromium \
    && rm -rf /var/lib/apt/lists/*

COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
