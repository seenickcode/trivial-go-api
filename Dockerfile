FROM golang:1.12-alpine

RUN set -ex; \
    apk update; \
    apk add --no-cache git

RUN apk --update add ca-certificates

ENV GO111MODULE=on

WORKDIR /app

COPY . .

RUN mkdir build

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -mod=vendor -o ./main ./*.go

WORKDIR /

EXPOSE 3001

CMD ["/app/main"]