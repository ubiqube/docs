FROM gradle:jdk8-alpine

ADD doc-src/		doc-src
ADD build.gradle	.

RUN gradle asciidoc
RUN gradle asciidoc_pdf

USER root
RUN apk add bash

CMD [ "bash" ]
