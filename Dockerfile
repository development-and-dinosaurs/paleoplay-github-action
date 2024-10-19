FROM golang:latest

RUN go install github.com/development-and-dinosaurs/paleoplay@v0.0.1

RUN go install github.com/playwright-community/playwright-go/cmd/playwright@latest
RUN playwright install --with-deps

COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
