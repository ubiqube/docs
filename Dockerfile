FROM gradle:jdk8-alpine

ADD doc-src/		doc-src
ADD build.gradle	.
ADD docker/		docker

RUN gradle asciidoctor

USER root
RUN apk add bash

CMD [ "bash" ]
