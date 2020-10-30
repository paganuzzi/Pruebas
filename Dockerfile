FROM alpine:3.11.5
RUN apk add --no-cache \
        libc6-compat
EXPOSE 8000
WORKDIR /aplicacion
COPY app .
ENTRYPOINT [ "./app" ]