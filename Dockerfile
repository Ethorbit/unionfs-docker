FROM alpine:latest
COPY ./start.sh /start.sh
VOLUME top bottom merged
ENV TZ="Etc/UTC"
ENV PUID=1000
ENV PGID=1000
ENV UMASK="0007"
ENV MERGED_DIR_NAME="files"
RUN chmod +x /start.sh &&\
    apk update &&\
    apk add --no-cache tzdata unionfs-fuse
CMD ["/start.sh"]
