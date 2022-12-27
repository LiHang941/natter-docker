FROM alpine:latest
ENV TZ=Asia/Shanghai
WORKDIR /root/

COPY entrypoint.sh /usr/local/bin/
COPY natter-config.json /root/
COPY natter-hook.sh /root/
RUN apk add --no-cache \
    ca-certificates  \
    bash  \
    curl \
    python3 && \
    rm -rf /var/cache/apk/* && \
    wget -O /root/natter.py https://raw.githubusercontent.com/MikeWang000000/Natter/v0.9/natter.py && \
    chmod a+x /usr/local/bin/entrypoint.sh 

ENTRYPOINT ["entrypoint.sh"]
CMD ["python3","/root/natter.py", "-c", "/root/conf/natter-config.json"]