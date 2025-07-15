# find
The `find` command searches for files and directories in a directory hierarchy based on specified conditions like name, type, size, modification time, and more.

## Basic Syntax
```bash
find [path] [options] [expression]
```
Example:
```bash
find . -name "*.log"
```

---

## Common Options
| Option            | Description                             |
| ----------------- | --------------------------------------- |
| `.`               | Current directory                       |
| `-name "*.ext"`   | Files with matching name (wildcard `*`) |
| `-iname "*.ext"`  | Case-insensitive name match             |
| `-type f`         | Files only                              |
| `-type d`         | Directories only                        |
| `-size +100M`     | Size greater than 100 MB                |
| `-mtime -7`       | Modified in last 7 days                 |
| `-empty`          | Find empty files or directories         |
| `-exec cmd {} \;` | Execute command on result               |
| `-delete`         | Delete found items (use with caution)   |
| `-user username`  | Owned by specific user                  |
| `-perm 644`       | Specific permissions                    |

---

## Examples
### Find by Name
```bash
find . -name "example.txt"
```

Find files named `example.txt` starting from the current directory.

---

### Find All `.log` Files (Recursively)
```bash
find /var/log -type f -name "*.log"
```

---

### Find All Directories Named `backup`
```bash
find . -type d -name "backup"
```

---

### Find Files Modified in Last 3 Days
```bash
find . -type f -mtime -3
```

---

### Find Files Larger Than 100 MB
```bash
find . -type f -size +100M
```

---

### Find Files with 777 Permissions
```bash
find . -type f -perm 0777
```

---

### Find and Delete Empty Files
```bash
find . -type f -empty -delete
```

---

### Find and Delete `.tmp` Files
```bash
find . -type f -name "*.tmp" -exec rm {} \;
```

---

### Find Files Owned by a Specific User
```bash
find /home -user myuser
```

---

### Combine `find` with `xargs` (Safer for Many Files)
```bash
find . -type f -name "*.log" -print0 | xargs -0 rm
```

---

## Safety Tips
* Test with `-print` before adding `-exec` or `-delete`.
* Quote patterns: use `"*.txt"` not `*.txt` to prevent shell expansion.
* Always validate with `-type f` or `-type d` to avoid unexpected results.

---

## Quick Commands Recap
| Task                    | Command                                    |
| ----------------------- | ------------------------------------------ |
| Find `.log` files       | `find . -name "*.log"`                     |
| Files > 10MB            | `find . -size +10M`                        |
| Modified in last 7 days | `find . -mtime -7`                         |
| Empty files             | `find . -type f -empty`                    |
| Delete `.bak` files     | `find . -name "*.bak" -delete`             |
| Execute command         | `find . -name "*.sh" -exec chmod +x {} \;` |


