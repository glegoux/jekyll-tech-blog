SHELL = /usr/bin/env bash

.PHONY: usage
usage:
	@echo "usage install update build test run run-dev run-debug"

.PHONY: all
all: update run

.PHONY: install
install:
	@bundle install

.PHONY: update
update:
	@bundle update

.PHONY: build
build:
	@JEKYLL_ENV=production bundle exec jekyll build --config "_config.yml"

.PHONY: test
test:
	@JEKYLL_ENV=production ./test/run_tests.sh

.PHONY: run
run:
	@bundle exec jekyll serve --host localhost --port 4000 --incremental --config "_config.yml" --no-watch

.PHONY: run-dev
run-dev:
	@bundle exec jekyll serve --host localhost --port 4000 --incremental --config "_config.yml,_config_dev.yml" --drafts --unpublished --livereload

.PHONY: run-debug
run-debug:
	@PAGES_REPO_NWO="glegoux/glegoux.github.io" JEKYLL_ENV=production bundle exec jekyll serve --host localhost --port 4000
