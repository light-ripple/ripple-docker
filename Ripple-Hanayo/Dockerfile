FROM golang
WORKDIR /go/src/zxq.co/ripple/

RUN go get -d -v zxq.co/ripple/hanayo
RUN CGO_ENABLED=0 go install -v ./...

FROM alpine
WORKDIR /ripple

COPY --from=0 /go/bin/hanayo /bin
RUN chmod +x /bin/hanayo

VOLUME [ "/ripple" ]
VOLUME [ "/avatars" ]

EXPOSE 45221

COPY start.sh /bin/runhanayo
RUN chmod +x /bin/runhanayo

CMD [ "/bin/runhanayo" ]
