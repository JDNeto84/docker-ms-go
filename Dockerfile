FROM golang:alpine as builder

WORKDIR /app

COPY main.go /app/main.go

RUN go mod init github.com/codeedu/myuuid && \
    go build -o main /app/

FROM scratch

COPY --from=builder /app/main /main

CMD ["/main"]