NAME = alpine-nginx-php
TAG = latest
IMAGE = michaeldim/$(NAME)

.PHONY: all build

all: build

build:
	@docker build -t $(IMAGE):$(TAG) --rm .
