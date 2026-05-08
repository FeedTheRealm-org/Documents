DOCKER_TAG=feed-docs:latest

image:
	docker build -t $(DOCKER_TAG) .
.PHONY: image

run:
	docker run -v $(shell pwd):/workspace --rm feed-docs:latest python3 generar_docs.py
.PHONY: run
