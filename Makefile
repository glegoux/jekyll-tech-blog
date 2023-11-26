SHELL = /usr/bin/env bash

.PHONY: usage
usage:
	@echo "usage all all-prod install update clean build build-prod doctor test run run-prod"

.PHONY: all
all: install clean build doctor test run

.PHONY: all-prod
all: install clean build-prod doctor test run-prod

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
	@JEKYLL_ENV=development bundle exec jekyll build \
		--config "src/_core/_config.yml,src/_config.yml,src/_config_dev.yml" \
		--trace

.PHONY: build-prod
build-prod:
	@JEKYLL_ENV=production bundle exec jekyll build \
		--config "src/_core/_config.yml,src/_config.yml" \
		--trace

.PHONY: test
test:
	@JEKYLL_ENV=production ./test/run_tests.sh

.PHONY: run
run:
	@JEKYLL_ENV=development bundle exec jekyll serve \
		--config "src/_core/_config.yml,src/_config.yml,src/_config_dev.yml" \
		--host localhost --port 4000 \
		--incremental --drafts --unpublished --livereload

.PHONY: run-prod
run-prod:
	@JEKYLL_ENV=production bundle exec jekyll serve \
		--config "src/_core/_config.yml,src/_config.yml" \
		--host localhost --port 4000 \
		--no-watch
