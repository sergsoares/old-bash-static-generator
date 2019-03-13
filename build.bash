#!/bin/bash

readonly PAGE_TITLE="Sergio Soares"
readonly MARKDOWN_POSTS="src/posts"
readonly HTML_POSTS="posts"

mkdir -p "${HTML_POSTS}"

files=("$(pwd)/${MARKDOWN_POSTS}"/*)
for filename in "${files[@]}"; do
    BASE_NAME=$(basename $filename)

    pandoc \
		"${MARKDOWN_POSTS}/${BASE_NAME}" \
		-o "${HTML_POSTS}/${BASE_NAME%.*}.html" \
		--metadata pagetitle="${PAGE_TITLE}" \
		--template=templates/index.html
done

pandoc \
	src/index.md \
	-o index.html \
	--metadata pagetitle="${PAGE_TITLE}" \
	--template=templates/index.html
