FROM gradle:7.6.4-jdk17-alpine

ADD doc-src/		doc-src
#ADD ccla-src/		ccla-src
ADD build.gradle	.
#ADD build_ccla.gradle	.

RUN	gradle asciidoc_msa_html
#RUN gradle asciidoc_msa_pdf
#RUN gradle -b build_ccla.gradle asciidoc_ccla_html
#RUN gradle -b build_ccla.gradle asciidoc_ccla_pdf
#RUN gradle -b build_pdf_jp.gradle asciidoc_msa_pdf

USER root
RUN apk add bash

CMD [ "bash" ]
