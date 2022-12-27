FROM alpine:latest
ENV TZ=Asia/Shanghai
WORKDIR /root/

COPY natter-config.json /root/conf/
COPY natter-hook.sh /root/conf/
RUN apk add --no-cache \
    ca-certificates  \
    bash  \
    ipset  \
    ip6tables \
    nftables  \
    iproute2 \
    curl \
    python3 && \
    rm -rf /var/cache/apk/* && \
    wget -O /root/natter.py https://raw.githubusercontent.com/MikeWang000000/Natter/v0.9/natter.py && \

CMD ["python","natter.py", "-c", "/root/conf/natter-config.json"]