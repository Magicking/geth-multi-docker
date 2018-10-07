FROM ethereum/client-go:alltools-latest

RUN apk add --update bind-tools

COPY run.sh /

ENTRYPOINT [ "/run.sh"]
