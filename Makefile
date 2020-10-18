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
	@JEKYLL_ENV=production bundle exec jekyll build \
		--config "src/_core/_config.yml,src/_config.yml" \
		 --trace

.PHONY: test
test:
	@JEKYLL_ENV=production ./test/run_tests.sh

.PHONY: run
run:
	@JEKYLL_ENV=production bundle exec jekyll serve \
		--config "src/_core/_config.yml,src/_config.yml" \
		--host localhost --port 4000 \
		--no-watch

.PHONY: run-dev
run-dev:
	@JEKYLL_ENV=development bundle exec jekyll serve \
        --host localhost --port 4000 \
		--config "src/_core/_config.yml,src/_config.yml,src/_config_dev.yml" \
		--incremental --drafts --unpublished --livereload --limit_posts 10
