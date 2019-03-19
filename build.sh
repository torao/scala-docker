#!/bin/bash
SCALA_VERSION=2.12.8

docker build -t torao/scala:openjdk11_scala2.12 --build-arg version=$SCALA_VERSION .
