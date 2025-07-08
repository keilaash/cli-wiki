# Shell Scripting: Conditional Statements

Conditional statements allow your script to make decisions.

## if Statement

```bash
if [ "$name" == "Alice" ]; then
  echo "Hi Alice!"
fi
```

## if-else Statement

```bash
if [ "$age" -gt 18 ]; then
  echo "Adult"
else
  echo "Minor"
fi
```

## if-elif-else Statement

```bash
if [ "$score" -ge 90 ]; then
  echo "Grade: A"
elif [ "$score" -ge 80 ]; then
  echo "Grade: B"
else
  echo "Grade: C or below"
fi
```

## Test Operators

- `-eq`, `-ne`, `-lt`, `-le`, `-gt`, `-ge`
- `==`, `!=` for strings
