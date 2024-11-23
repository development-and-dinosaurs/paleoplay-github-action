FROM golang:1.23 as builder
RUN go install github.com/playwright-community/playwright-go/cmd/playwright@v0.4702.0
RUN go install github.com/development-and-dinosaurs/paleoplay@v0.1.1

FROM ubuntu:noble
COPY --from=builder /go/bin/playwright /go/bin/paleoplay /
RUN apt-get update && apt-get install -y ca-certificates tzdata \
    && PLAYWRIGHT_DRIVER_PATH=/github/home/.cache/ /playwright install chromium --with-deps \
    && rm -rf /var/lib/apt/lists/*

COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
