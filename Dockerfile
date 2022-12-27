FROM alpine:latest
ENV TZ=Asia/Shanghai
WORKDIR /root/

COPY run.sh /root/
COPY natter-config.json /root/
COPY natter-hook.sh /root/
RUN apk add --no-cache \
    ca-certificates  \
    bash  \
    curl \
    python3 && \
    rm -rf /var/cache/apk/* && \
    wget -O /root/natter.py https://raw.githubusercontent.com/MikeWang000000/Natter/v0.9/natter.py && \
    mkdir /root/conf/

CMD ["/bin/sh", "-c", "bash run.sh 2>&1"]