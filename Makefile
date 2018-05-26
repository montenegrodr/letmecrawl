VERSION := "0.12"

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
