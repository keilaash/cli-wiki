# Shell Scripting: Loops

Loops let you execute commands repeatedly.

## for Loop

```bash
for i in 1 2 3 4 5; do
  echo "Number $i"
done
```

## while Loop

```bash
count=1
while [ $count -le 5 ]; do
  echo "Count $count"
  ((count++))
done
```

## until Loop

```bash
count=1
until [ $count -gt 5 ]; do
  echo "Count $count"
  ((count++))
done
```
