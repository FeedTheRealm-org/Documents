DOCKER_TAG=feed-docs:latest

docker-image:
	docker build -t $(DOCKER_TAG) .
.PHONY: docker-image

docker-run:
	docker run -v $(pwd):/workspace --rm -it feed-docs:latest sh -c ./generar_docs.sh
.PHONY: docker-run