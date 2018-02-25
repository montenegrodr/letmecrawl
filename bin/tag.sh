#!/usr/bin/env bash

version=${1}

git tag $version -m $version
git push --tags origin master

