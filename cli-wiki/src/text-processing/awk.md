# awk command guide
`awk` is a powerful text processing tool and language. It's great for extracting and formatting text based on patterns and fields.

## Basic Syntax
```bash
awk '{print $1}' file.txt
```

Prints the first field of each line (default field separator is whitespace).

## Common Uses
* Field extraction
* Text formatting
* Condition-based filtering

## Examples
```bash
awk -F: '{print $1}' /etc/passwd      # Print usernames
awk '{if ($3 > 50) print $0}' data.txt  # Print lines where 3rd field > 50
awk '{print NR, $0}' file.txt         # Print line numbers
```

## Notes
* Use `-F` to change the field separator.
* Supports full programming logic (loops, conditions, functions).

| Command | Description |
|--------|-------------|
| `awk '{print $1}' file.txt` | Print first field of each line |
| `awk -F: '{print $1}' /etc/passwd` | Print usernames |
| `awk '$3 > 100 {print $0}' data.txt` | Lines where 3rd field > 100 |
| `awk '{print NR, $0}' file.txt` | Add line numbers |  


