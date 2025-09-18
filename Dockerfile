FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-lang-spanish \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

VOLUME ["/workspace"]

CMD ["sh", "-c", "pdflatex -interaction=nonstopmode main.tex && \
                  pdflatex -interaction=nonstopmode main.tex && \
                  rm -f main.aux main.log main.out main.toc main.fls main.fdb_latexmk"]
