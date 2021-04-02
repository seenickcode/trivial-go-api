FROM golang:1.16.3-alpine as builder

# RUN set -ex; \
#     apk update; \
#     apk add --no-cache git

# RUN apk --update add ca-certificates

ENV GO111MODULE=on
ENV PORT=3001

RUN mkdir /build

WORKDIR /build

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o main .

FROM scratch 

COPY --from=builder /build/main /app/

WORKDIR /app

CMD ["./main"]