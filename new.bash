#!/bin/bash

slugify() {
	echo "${1}" | iconv -t ascii//TRANSLIT | sed -E 's/[~\^]+//g' | sed -E 's/[^a-zA-Z0-9]+/-/g' | sed -E 's/^-+\|-+$//g' | sed -E 's/^-+//g' | sed -E 's/-+$//g' | tr A-Z a-z
}

TITLE="$@"
SLUG=$(slugify "${TITLE}")
DATE=`date +%Y-%m-%d`
DATE_POST_LIST=$(TZ=GMT date "+%B %d, %Y")

# Creating Frontmatter for content.
echo '---
title: "'${TITLE}'"
slug: "'${SLUG}'"
date: "'${DATE}'"
---
' > src/posts/"${SLUG}".md

# Append post to index.md list.
OUTPUT=$(echo "* [${TITLE}](dist/posts/${SLUG}) - ${DATE_POST_LIST}" | cat - src/index.md)

# Rewrite index.md
echo "${OUTPUT}" > src/index.md