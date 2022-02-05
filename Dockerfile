
FROM golang:latest as builder

WORKDIR $GOPATH


RUN go get -u github.com/schachmat/wego
WORKDIR $GOPATH/src/github.com/schachmat/wego


RUN go get -d -v ./...


RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /go/bin/wego .


FROM alpine:latest


LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/Rafik89PL/wsb-weather-app-docker"
LABEL org.label-schema.name="docker-weather-wsb"
LABEL org.label-schema.description="Check weather WSB"
LABEL org.label-schema.version=$VER


WORKDIR /usr/local/bin/
COPY --from=builder /go/bin/wego .
RUN chmod +x wego

ENTRYPOINT ["/usr/local/bin/wego"]
