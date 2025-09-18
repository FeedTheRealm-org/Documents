DOCKER_TAG=feed-docs:latest

docker-image:
	docker build -t $(DOCKER_TAG) .
.PHONY: docker-image

docker-run:
	docker run -v $(shell pwd):/workspace --rm -it feed-docs:latest python3 generar_docs.py
.PHONY: docker-run
