# Shell Scripting: Variables

Variables are used to store data that can be reused throughout your script.

## Defining Variables

```bash
name="Alice"
age=30
```

Note: No spaces around the `=` sign.

## Using Variables

```bash
echo "Name: $name"
echo "Age: $age"
```

## Special Variables

- `$0` - Script name
- `$1` to `$9` - Positional parameters
- `$#` - Number of arguments
- `$@` - All arguments
