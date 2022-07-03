FROM golang:alpine AS builder

RUN mkdir /app
WORKDIR /app

COPY main.go /app

RUN go mod init rocks
RUN go build -o /app/rocks

FROM scratch

COPY --from=builder /app/rocks /app/rocks

ENTRYPOINT ["/app/rocks"]