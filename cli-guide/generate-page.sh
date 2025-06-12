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

# Escape special HTML characters in TITLE
escape_html() {
  echo "$1" | sed -e 's/&/\&amp;/g' -e 's/"/\&quot;/g' -e "s/'/\&apos;/g" -e 's/</\&lt;/g' -e 's/>/\&gt;/g'
}

TITLE_ESCAPED=$(escape_html "$TITLE")

# Read the generated body content
CONTENT=$(<"$TMP_BODY")

# Handle newlines in content by replacing them with <br> tags
CONTENT=$(echo "$CONTENT" | sed 's/$/<br>/')

# Ensure <pre><code> blocks are handled properly
CONTENT=$(echo "$CONTENT" | sed 's/```/ <pre><code>/g')
CONTENT=$(echo "$CONTENT" | sed 's/```/<\/code><\/pre>/g')

# Replace placeholders in the HTML template and insert the correct asset links
sed "s|{{TITLE}}|$TITLE_ESCAPED|g" "$TEMPLATE" | awk -v content="$CONTENT" '
  /{{CONTENT}}/ {
    sub(/{{CONTENT}}/, content)
    print
    next
  }
  { print }
' > "$OUT_FILE"

# Now link CSS, JS, and images from the assets folder
echo "Adding links to CSS, JS, and Images..."

# Add CSS
sed -i 's|</head>|<link rel="stylesheet" href="../assets/css/styles.css">\n</head>|' "$OUT_FILE"

# Add JS
sed -i 's|</body>|<script src="../assets/js/script.js"></script>\n</body>|' "$OUT_FILE"

# Add image assets (Example: header image or logo)
# For example, if you want to use an image in the page:
# sed -i 's|<div class="content">|<div class="content"><img src="../assets/images/icons/logo.png" alt="Logo">|' "$OUT_FILE"

rm "$TMP_BODY"

echo "✅ Generated $OUT_FILE from $MD_DIR/$MD_FILE"

