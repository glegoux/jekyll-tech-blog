# AGENTS.md

Guidance for coding agents (Claude Code, Codex, Cursor, ...) working in this repository.

## Project

**Jekyll Tech Blog**: a template for building a tech blog with Jekyll and deploying it as static files
(GitHub Pages, Netlify, or on-premise). Users fork it, then pull later template changes with
`bin/utils/update.sh`.

- Ruby version: `.ruby-version`
- Jekyll and plugin versions are **pinned exactly** in `Gemfile`. Keep them pinned and update `Gemfile.lock` with them.
- Project version: `VERSION` (a symlink to `src/_core/includes/VERSION`).

## Commands

`source bootstrap.sh` switches to the project Ruby with rvm and adds `bin/` to `PATH`.

Everything goes through `make` (see `Makefile`). Every Jekyll command needs the layered `--config` list, so
use the make targets instead of calling `jekyll` yourself.


## Layout

```
src/_core/                         Template engine. Shared by every blog built from the template.
  _config.yml                      Core Jekyll configuration and vendored library versions (project_core.libs.version)
  includes/ layouts/ sass/ data/   Each has a project/ subfolder for per-blog overrides
  static/{css,js,img}              Core assets
  static/libs/<lib>/<version>/     Vendored third-party front-end libraries
  search.json stats.* pinned-posts.* rss.xml atom.xml manifest.json
src/                Blog content and settings, owned by whoever uses the template
  _config.yml       Site config (production); _config_dev.yml adds development overrides
  _posts/ _drafts/  Articles (YYYY-MM-DD-title.md)
  _static/          Blog-specific static files
  about/ blog/ index.* 404.*
bin/article/        Helpers for writing articles (create-empy-article.sh writes a new draft)
bin/utils/          Maintenance scripts (update.sh, generate-integrity-assets.sh, ...)
test/               run_tests.sh, checker/ (css, json, feeds), inspect/ (gem dependencies)
examples/           Example blogs built from the template
.github/            CI workflows; files/ is copied into the gh-pages deploy output
build/              Build output (gitignored, never edit or commit)
```

## Rules

### Core and blog content are separate
- `bin/utils/update.sh` merges template updates into forks and **discards** changes to `src/*` (except
  `src/_core`), `src/_core/*/project/`, `.github/`, `resources/` and `README.md`. Generic template
  features therefore belong in `src/_core/`. Per-blog customisation belongs in `src/` or the `project/`
  override folders.
- Don't override `src/_core/_config.yml` settings from `src/_config.yml` unless the change requires it
  (the core config says the same).
- Posts in `src/_posts/` are demo content. Leave them alone unless the task is about them. Front matter uses
  `title`, `description`, `authors` (keys of `project.article.authors` in `src/_config.yml`),
  `time_reading_minutes`, `category`, `tags` and `pinned`.

### Front-end dependencies
- Third-party libraries are **vendored**, not loaded from a CDN, at
  `src/_core/static/libs/<lib>/<version>/`. To upgrade one (the "Update jquery" / "Update fuse" commits show how):
  1. add the new version directory and remove the old one,
  2. bump the version in `project_core.libs.version` in `src/_core/_config.yml` and keep the reference URL comment,
  3. check `src/_core/includes/js.html` / `css.html` and the pages that use the library, such as search with fuse
     or dates with moment.
- Don't add new runtime dependencies (npm packages, bundlers, new gems) without asking. The site has no
  front-end build step beyond Jekyll's Sass.

### Code style
- Follow `.editorconfig`: UTF-8, LF line endings, 2-space indent for html/js/css/scss/json/yml/md, tabs in the Makefile,
  120-character lines, final newline.
- Sass: use `@use`, never the deprecated `@import`. Partials live in `src/_core/sass/`.
- JS: plain browser JavaScript with jQuery, and no `console.log` left in committed code.
- Liquid/HTML: close every tag (past fixes were for unclosed `<a>`). Keep `{%- -%}` whitespace control as it is.
- Shell scripts: `#!/usr/bin/env bash`, `cd "$(git rev-parse --show-toplevel)" || exit 1` when the script
  depends on the repo root, errors to stderr (`>&2 echo "ERROR: ..."`).
- Keep the accessibility (`blog-accessibility.html`, alt/title attributes), SEO (jekyll-seo-tag, sitemap) and PWA
  (`manifest.json`) features working.

### Git conventions (from the history)
- Commit subjects are short, capitalised, imperative and have no prefix or trailing period:
  `Fix search engine to find blog posts`. Don't use Conventional Commits prefixes.
- Make one logical change per commit, such as a single dependency bump.
- Work on `main`. Dependabot opens PRs for gem bumps. CI (`Test`) runs on pushes to `main`.
- The `Deploy` workflow is disabled on purpose (it triggers on branch `nothing`). Don't re-enable it unless asked.
- Never commit `build/`, `_site/`, `.jekyll-cache`, `.jekyll-metadata` or `.sass-cache`.
- `CHANGELOG.md` uses Keep a Changelog with SemVer. Update it when a change is meant for a release.

### General
- Do the requested change and nothing more. This template is used by other blogs, so small, backward-compatible
  changes are best.
- After editing templates, Sass or config, run `make build && make test` before you call the work done.
