FROM alpine
RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm -O /usr/local/bin/cloudflared && chmod a+x /usr/local/bin/cloudflared
RUN addgroup -g 1000 app && adduser -u 1000 -G app -s /bin/sh -D app
USER app
ENTRYPOINT ["cloudflared", "--no-autoupdate"]
CMD ["version"]