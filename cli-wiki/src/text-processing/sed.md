# sed command guide
`sed` is a stream editor used to find and replace text, delete lines, or modify content on the fly.

## Basic Syntax
```bash
sed 's/find/replace/' file.txt
```

Replaces the first occurrence of `find` with `replace` on each line.

## Common Options
* `-i`: Edit file in place
* `s/pattern/replace/g`: Replace all occurrences in each line
* `d`: Delete lines

## Examples
```bash
sed 's/foo/bar/' file.txt           # Replace first 'foo' with 'bar'
sed 's/foo/bar/g' file.txt          # Replace all 'foo' with 'bar'
sed -i 's/http/https/g' urls.txt    # Edit file in place
sed '/DEBUG/d' app.log              # Delete lines containing 'DEBUG'
```

## Notes
* Use single quotes to prevent shell variable expansion.
* Powerful for batch editing configuration files or scripts.

| Command | Description |
|--------|-------------|
| `sed 's/foo/bar/' file.txt` | Replace first 'foo' with 'bar' |
| `sed 's/foo/bar/g' file.txt` | Replace all occurrences |
| `sed -i 's/http/https/g' urls.txt` | Replace in-place |
| `sed '/DEBUG/d' log.txt` | Delete lines containing DEBUG |  


