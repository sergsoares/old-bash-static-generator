#!/bin/bash

readonly PAGE_TITLE="Sergio Soares"

mkdir -p dist/posts

files=("$(pwd)/src/posts"/*)
for filename in "${files[@]}"; do
    BASE_NAME=$(basename $filename)

    pandoc \
		src/posts/"${BASE_NAME}" \
		-o dist/posts/"${BASE_NAME%.*}.html" \
		--metadata pagetitle="${PAGE_TITLE}" \
		--template=templates/index.html
done

BASE_NAME=$(basename "$(pwd)/src/index.md")
pandoc \
	src/"${BASE_NAME}" \
	-o dist/"${BASE_NAME%.*}.html" \
	--metadata pagetitle="${PAGE_TITLE}" \
	--template=templates/index.html