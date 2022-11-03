FROM	alpine

RUN		apk update

RUN		apk add busybox-extras

COPY	tools/script.sh /

RUN		chmod +x script.sh

ENTRYPOINT [ "/script.sh" ]