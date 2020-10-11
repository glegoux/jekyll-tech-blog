SHELL = /usr/bin/env bash

.PHONY: usage
usage:
	@echo "usage install update clean doctor build test run run-dev"

.PHONY: all
all: install clean build doctor test run

.PHONY: install
install:
	@bundle install

.PHONY: update
update:
	@bundle update

.PHONY: clean
clean:
	@bundle exec jekyll clean --config "src/_core/_config.yml,src/_config.yml"

.PHONY: doctor
doctor:
	@bundle exec jekyll doctor --config "src/_core/_config.yml,src/_config.yml"

.PHONY: build
build:
	@JEKYLL_ENV=production bundle exec jekyll build --trace --config "src/_core/_config.yml,src/_config.yml"

.PHONY: test
test:
	@JEKYLL_ENV=production ./test/run_tests.sh

.PHONY: run
run:
	@JEKYLL_ENV=production bundle exec jekyll serve --host localhost --port 4000 --config "src/_core/_config.yml,src/_config.yml" --no-watch

.PHONY: run-dev
run-dev:
	@JEKYLL_ENV=development bundle exec jekyll serve --incremental --config "src/_core/_config.yml,src/_config.yml,src/_config_dev.yml" --drafts --unpublished --livereload
