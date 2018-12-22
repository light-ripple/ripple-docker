FROM golang

WORKDIR /go/src/zxq.co/ripple/

RUN go get -d -v zxq.co/ripple/rippleapi
RUN CGO_ENABLED=0 go install -v ./...

FROM alpine

WORKDIR /ripple

VOLUME [ "/ripple" ]
EXPOSE 40001

COPY --from=0 /go/bin/rippleapi /bin

RUN chmod +x /bin/rippleapi

WORKDIR /ripple
CMD [ "/bin/rippleapi" ]
