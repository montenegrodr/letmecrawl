#!/usr/bin/env bash

version=${1}

rm -rf dist *.egg-info
./bin/tag.sh $version
pip install -U pip setuptools twine
pip install pyOpenSSL ndg-httpsclient pyasn1
python setup.py sdist
twine upload dist/*
