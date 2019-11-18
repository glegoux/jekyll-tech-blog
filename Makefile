SHELL = /usr/bin/env bash

.PHONY: usage
usage:
	@echo "usage install update run run-dev run-debug"

.PHONY: all
all: update run

.PHONY: install
install:
	@bundle install

.PHONY: update
update:
	@bundle update

.PHONY: run
run: run-dev

.PHONY: run-dev
run-dev:
	@bundle exec jekyll serve --host 0.0.0.0 --port 4000 --config "_config.yml,_config_dev.yml"

.PHONY: run-debug
run-debug:
	@PAGES_REPO_NWO="glegoux/glegoux.github.io" JEKYLL_ENV=production bundle exec jekyll serve --host 0.0.0.0 --port 4000