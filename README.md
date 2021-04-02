# Trivial Go API

## Run

```
PORT=3001 go run main.go
```

## Docker

```
docker build -t seenickcode-example .
docker run --rm -it --env PORT=3001 -p 3001:3001 seenickcode-example
```