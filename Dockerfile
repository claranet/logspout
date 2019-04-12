FROM golang:1.12-alpine AS builder

ARG GOOS=linux
ARG GOARCH=amd64

COPY . $GOPATH/src/github.com/claranet/logspout/
WORKDIR $GOPATH/src/github.com/claranet/logspout/

RUN go get -v
RUN go build -o $GOPATH/bin/logspout

####################################

FROM alpine:3.9

#RUN  apk add --update ca-certificates

COPY --from=builder /go/bin/logspout /bin/logspout

ENTRYPOINT ["/bin/logspout"]
VOLUME /mnt/routes
EXPOSE 80