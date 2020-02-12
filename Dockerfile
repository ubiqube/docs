FROM gradle:jdk8-alpine

ADD doc-src/		doc-src
ADD build.gradle	.

RUN gradle asciidoctor

USER root
RUN apk add bash

CMD [ "bash" ]
