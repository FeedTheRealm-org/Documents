DOCKER_TAG=feed-docs:latest

image:
	docker build -t $(DOCKER_TAG) .
.PHONY: image

run:
	docker run -v $(shell pwd):/workspace --rm feed-docs:latest python3 generate_docs.py
.PHONY: run

run-%:
	docker run -v $(shell pwd):/workspace --rm $(DOCKER_TAG) python3 generate_docs.py $*
.PHONY: run-%

clean:
	@rm -f *.pdf
.PHONY: clean
