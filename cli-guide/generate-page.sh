#!/bin/bash

# Usage: ./generate-page.sh "Page Title" misc.md

TITLE="$1"
MD_FILE="$2"

MD_DIR="markdown"
HTML_DIR="pages"
TEMPLATE="templates/page-template.html"
OUT_FILE="$HTML_DIR/${MD_FILE%.md}.html"
TMP_BODY="__temp_body.html"

# Ensure pandoc exists
if ! command -v pandoc >/dev/null 2>&1; then
  echo "❌ Error: pandoc is not installed."
  exit 1
fi

# Generate HTML from Markdown using GitHub-flavored markdown
pandoc --from=gfm --to=html "$MD_DIR/$MD_FILE" -o "$TMP_BODY"

# Inject content safely
TITLE_ESCAPED=$(printf '%s\n' "$TITLE" | sed 's/[&/\]/\\&/g')
CONTENT=$(<"$TMP_BODY")

# Replace placeholders
sed "s|{{TITLE}}|$TITLE_ESCAPED|g" "$TEMPLATE" | awk -v content="$CONTENT" '
  /{{CONTENT}}/ {
    sub(/{{CONTENT}}/, content)
    print
    next
  }
  { print }
' > "$OUT_FILE"

rm "$TMP_BODY"

echo "✅ Generated $OUT_FILE from $MD_DIR/$MD_FILE"

