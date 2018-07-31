VERSION    := "0.12"
DOCKER_TAG := "0.1"

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
	sudo docker build . -t letmecrawl:${DOCKER_TAG}
	sudo docker build . -t letmecrawl:latest

.PHONY: push-docker
push-docker:
    sudo docker push montenegrodr/letmecrawl:${DOCKER_TAG}
	sudo docker push montenegrodr/letmecrawl:latest
