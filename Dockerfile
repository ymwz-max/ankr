FROM  golang:alpine3.13 AS builder
RUN mkdir /go/src/app
WORKDIR /go/src/app
COPY ./ ./

RUN CGO_ENABLED=0 GOOS=linux go build -o ser ankr/main.go

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /go/src/app/ser .
CMD ["/root/ser"]