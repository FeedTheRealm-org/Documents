#!/bin/bash

cd example && \
pdflatex -interaction=nonstopmode -output-directory=. main.tex > /dev/null 2>&1 && \
rm -f main.aux main.log main.out main.toc main.fls main.fdb_latexmk