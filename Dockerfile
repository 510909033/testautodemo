FROM alpine
ADD asdfgh /data/app/
ADD version.txt /data/app/
WORKDIR /data/app/
CMD ["/bin/sh","-c","./asdfgh"]
