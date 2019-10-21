FROM ethereum/client-go:alltools-latest

RUN apk add --update bind-tools

COPY run.sh /

USER 1001

ENTRYPOINT [ "/run.sh"]
