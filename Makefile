SHELL = /usr/bin/env bash

.PHONY: usage
usage:
	@echo "usage install update clean build test run run-dev"

.PHONY: all
all: update run

.PHONY: install
install:
	@bundle install

.PHONY: update
update:
	@bundle update

.PHONY: clean
clean:
	@rm -r dest/

.PHONY: build
build:
	@JEKYLL_ENV=production bundle exec jekyll build --config "src/_core/_config.yml,src/_config.yml"

.PHONY: test
test:
	@JEKYLL_ENV=production ./test/run_tests.sh

.PHONY: run
run:
	@bundle exec jekyll serve --host localhost --port 4000 --incremental --config "src/_core/_config.yml,src/_config.yml" --no-watch

.PHONY: run-dev
run-dev:
	@bundle exec jekyll serve --host localhost --port 4000 --incremental --config "src/_core/_config.yml,src/_config.yml,src/_config_dev.yml" --drafts --unpublished --livereload
