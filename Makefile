SHELL = /usr/bin/env bash

.PHONY: usage
usage:
	@echo "usage install update clean build build-example doctor test run-prod run"

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

.PHONY: build-example
build-example:
	@JEKYLL_ENV=production bundle exec jekyll build \
		--config "src/_core/_config.yml,src/_config.yml,_config_deploy_template.yml" \
		--trace

.PHONY: test
test:
	@JEKYLL_ENV=production ./test/run_tests.sh

.PHONY: run-prod
run-prod:
	@JEKYLL_ENV=production bundle exec jekyll serve \
		--config "src/_core/_config.yml,src/_config.yml" \
		--host localhost --port 4000 \
		--no-watch

.PHONY: run
run:
	@JEKYLL_ENV=development bundle exec jekyll serve \
		--config "src/_core/_config.yml,src/_config.yml,src/_config_dev.yml" \
                --host localhost --port 4000 \
		--incremental --drafts --unpublished --livereload
