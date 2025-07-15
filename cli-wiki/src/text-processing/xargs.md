# xargs command guide
`xargs` builds and executes command lines from input. It’s useful for handling input that spans multiple lines or needs to be passed as arguments.

## Basic Syntax
```bash
command | xargs other_command
```

## Examples
```bash
ls *.txt | xargs rm            # Deletes all .txt files
find . -type f | xargs wc -l   # Count lines in all files
echo "file1 file2" | xargs cat # Concatenate files
```

## Common Options
* `-n <num>`: Use at most `<num>` arguments per command
* `-I {}`: Replace `{}` with input (for more flexible templates)
* `-0`: Use with `find -print0` to handle filenames with spaces

```bash
find . -name "*.log" -print0 | xargs -0 rm
```

## Notes
* Great for batch operations.
* Safer when combined with `-0` to avoid issues with spaces or newlines.

| Command | Description |
|--------|-------------|
| `ls *.log | xargs rm` | Delete all .log files |
| `echo "file1 file2" | xargs cat` | Concatenate files |
| `find . -type f | xargs wc -l` | Count lines in all files |
| `find . -print0 | xargs -0 rm` | Safe delete with null separator |  


