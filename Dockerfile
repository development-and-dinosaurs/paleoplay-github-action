FROM golang:latest

RUN go install github.com/development-and-dinosaurs/paleoplay@v0.0.1

COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
