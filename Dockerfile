FROM golang:1.12 AS builder

ARG GOOS=linux
ARG GOARCH=amd64
ARG CGO_ENABLED=0

COPY . $GOPATH/src/github.com/claranet/logspout/
WORKDIR $GOPATH/src/github.com/claranet/logspout/

RUN go get -v
RUN go build -ldflags "-X main.Version=v1.0.0-rc2" -o $GOPATH/bin/logspout

####################################

FROM alpine:3.9

LABEL version="v1.0.0-rc2"
LABEL maintainer="Martin Weber <martin.weber@de.clara.net>"
LABEL description="Logspout is a log router for Docker containers that runs inside Docker. It attaches to all containers on a host, then routes their logs wherever you want. It also has an extensible module system."

#RUN  apk add --update ca-certificates

COPY --from=builder /go/bin/logspout /bin/logspout

ENTRYPOINT ["/bin/logspout"]
VOLUME /mnt/routes
EXPOSE 80