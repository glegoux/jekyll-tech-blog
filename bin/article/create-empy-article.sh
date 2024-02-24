#!/usr/bin/env bash

cd $(dirname "$0")

# helper

ROOT_DIR="$(git rev-parse --show-toplevel)"

error() {
    local message="$1"
    echo >&2 "${message}"
    exit 1
}

# main

echo "Precise the metadata of your article:"
read -p "Title*: " title

if [ -z "${title}" ]; then
    error "title msut be not empty!"
fi

read -p "Description*: " description

if [ -z "${description}" ]; then
    error "description must be not empty!"
fi

read -p "Author: " author

if [ -z "${author}" ]; then
    author="${USER}"
    echo "default author: ${author}"
fi

read -p "Reading time*: " reading_time

if [[ -z ${reading_time} ]] || ! [[ ${reading_time} =~ ^[1-9]+[0-9]*$ ]]; then
    error "reading time must be not empty an be a number!"
fi

read -p "Category*: " category

if [ -z ${category} ]; then
    error "category must be not empty!"
fi

# remove all leading, trailing and multiple white-space characters,
# then convert to lower case, with dash as word-separator
canonical_title="$(echo ${title##*( )} | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')"

# remove all leading, trailing and multiple white-space characters
description="$(echo ${description##*( )})"

# remove all leading, trailing and multiple white-space characters
category="$(echo ${category##*( )})"

current_date="$(date +"%Y-%m-%d")"

article_path="${ROOT_DIR}/src/_drafts/${current_date}-${canonical_title}.md"

if [ -f "${article_path}" ]; then
    error "Failed to create ${article_path} it exists already!"
fi

echo "---
pinned: false
title: \"${title}\"
description: \"${description}\"
authors: [\"${author}\"]
time_reading_minutes: ${reading_time}
category: \"${category}\"
---

Read https://glegoux.com/blog/articles/2019/01/21/getting-started.html to get started!
" > "${article_path}"

echo "Created your template at ${article_path} as draft"

read -p "Do you want open your default editor to modify it [Y/n]?"

if [[ -z ${answer} ]] || [[ ${answer} =~ ^y|Y|yes$ ]]; then
  xdg-open "${article_path}" &
fi


