MAKEFLAGS += --warn-undefined-variables
PATH := node_modules/.bin:$(PATH)
SHELL := /bin/bash

.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

.PHONY: all
all:
	@true

node_modules: package.json
	@npm prune
	@npm install
	@touch node_modules

.PHONY: test
test:
	@true

.PHONY: deploy
deploy: node_modules
	surge ./public blog.nomadaxe.com
