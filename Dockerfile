FROM golang:1.7.3 AS builder
WORKDIR /go/src/github.com/paganuzzi/test-actions
RUN go get -d -v golang.org/x/net/html  
COPY app.go    .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:3.11.5
RUN apk --no-cache add ca-certificates libc6-compat
EXPOSE 8000
WORKDIR /root/
COPY --from=builder /go/src/github.com/paganuzzi/test-actions/app .
CMD ["./app"]