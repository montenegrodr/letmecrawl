VERSION    := "0.13"
DOCKER_TAG := "0.2"

.PHONY: tag
tag:
	git tag ${VERSION} -m "${VERSION}"
	git push --tags origin master

.PHONY: upload
upload: 
	pip install -U pip setuptools twine
	pip install pyOpenSSL ndg-httpsclient
	python setup.py sdist
	twine upload dist/*

.PHONY: build-docker
build-docker:
	sudo docker build . -t montenegrodr/letmecrawl-br:${DOCKER_TAG}
	sudo docker build . -t montenegrodr/letmecrawl-br:latest

.PHONY: push-docker
push-docker:
	sudo docker push montenegrodr/letmecrawl-br:${DOCKER_TAG}
	sudo docker push montenegrodr/letmecrawl-br:latest
