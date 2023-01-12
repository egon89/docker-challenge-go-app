# Build stage
FROM golang:1.16-alpine AS build

WORKDIR /app

RUN go mod init hello-go-challenge-app

COPY *.go ./

RUN go build -o /hello-go-challenge

# Run stage
FROM scratch

WORKDIR /

COPY --from=build /hello-go-challenge .

ENTRYPOINT ["/hello-go-challenge"]
