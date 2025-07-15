# grep
`grep` is used to search for patterns within files or input streams. It's fast and supports regular expressions.

## Basic Usage
```bash
grep "pattern" filename
````

## Common Options
* `-i`: Case-insensitive search
* `-r`: Recursive search in directories
* `-n`: Show line numbers
* `-v`: Invert match (show lines that do NOT match)
* `--color=auto`: Highlight matches

## Examples
```bash
grep "ERROR" /var/log/syslog
grep -i "user" users.txt
grep -r "main()" src/
```

## Extended grep variants
* `egrep`: Same as `grep -E` (Extended regex)
* `fgrep`: Same as `grep -F` (Fixed strings)

| Command | Description |
|--------|-------------|
| `grep "text" file.txt` | Search for "text" in a file |
| `grep -i "text"` | Case-insensitive search |
| `grep -r "main()" ./src` | Recursive search in directory |
| `grep -v "skip"` | Show lines that don't match |
| `grep -n "foo"` | Show line numbers |  


