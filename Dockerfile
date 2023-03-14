FROM alpine:latest
COPY ./entrypoint.sh /entrypoint.sh
ARG TZ="Etc/UTC"
ENV TZ=${TZ}
RUN chmod +x /entrypoint.sh &&\
    apk update &&\
    apk add --no-cache tzdata unionfs-fuse findmnt &&\
    ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime &&\
    echo $TZ > /etc/timezone
ENTRYPOINT ["/entrypoint.sh"]
