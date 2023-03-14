FROM alpine:latest
COPY ./entrypoint.sh /entrypoint.sh
ENV TZ="Etc/UTC"
ENV PUID=1000
ENV PGID=1000
RUN chmod +x /entrypoint.sh &&\
    apk update &&\
    apk add --no-cache tzdata unionfs-fuse findmnt
ENTRYPOINT ["/entrypoint.sh"]
