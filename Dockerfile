FROM alpine
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o k8sdemo main.go
ADD k8sdemo /data/app/
ADD version.txt /data/app/
WORKDIR /data/app/
CMD ["/bin/sh","-c","./k8sdemo"]
