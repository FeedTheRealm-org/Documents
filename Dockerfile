FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-lang-spanish \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

VOLUME ["/workspace"]

COPY . /workspace
