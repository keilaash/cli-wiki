# Shell Scripting: Functions

Functions are blocks of code that can be reused.

## Defining a Function

```bash
greet() {
  echo "Hello, $1"
}
```

## Calling a Function

```bash
greet "Alice"
```

## Returning Values

```bash
add() {
  return $(($1 + $2))
}

add 3 4
echo $?  # Output: 7
```

Note: `$?` captures the return value.
