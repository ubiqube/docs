documentation    [![build][build-icon]][build-page]
=============

[build-icon]: ../../workflows/CI/badge.svg
[build-page]: ../../actions


MSA User Manual, Admin Guide, Developer Guide and Lab Guide

The doc source is written in [asciidoc](http://asciidoc.org/) format

To view the doc formatted you need to clone the git repo and checkout the branch you are interested in.

You can use the [asciidoc browser extension](https://github.com/asciidoctor/asciidoctor-browser-extension) to view the doc rendered in HTML.


Building the doc
----------------

Clone the repository
Checkout the branch you need to use and build the doc with the CLI command below

	docker build -t ubi.docs .
	
if you have gradle you can also execute
	
	gradle asciidoc_msa_html
	gradle asciidoc_msa_pdf
	gradle -b build_ccla.gradle asciidoc_ccla_html

The doc is generated in build/docs/


Inspecting the result
---------------------

	docker run --rm ubi.docs tar c build | tar x

	docker run --rm -it ubi.docs
