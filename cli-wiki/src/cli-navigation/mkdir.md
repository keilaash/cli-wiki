# `mkdir` Command Guide for Creating Directories

This guide helps you use the `mkdir` (make directory) command to create new folders in your Unix/Linux file system.

---

## What is `mkdir`, and Why Use It?

The `mkdir` command is used to **create new directories** (folders) in your current or specified location.

### Why Learn `mkdir`?

* **Organize files** into logical structures
* **Set up project folders** quickly via CLI
* **Automate directory creation** in scripts or build systems

> Directories are the backbone of how files are structured in Unix. Mastering `mkdir` is essential for working efficiently in the terminal.

---

## 1. Create a Single Directory

```bash
mkdir my_folder
```

*Creates `my_folder` in the current working directory.*

---

## 2. Create a Directory with a Full Path

```bash
mkdir /home/user/projects/my_folder
```

*Makes the directory inside the specified path.*

---

## 3. Create Parent Directories Automatically

```bash
mkdir -p path/to/my_folder
```

*`-p` creates any missing parent directories along the way.*

> Without `-p`, `mkdir` will fail if intermediate directories don’t already exist.

---

## 4. Show Messages When Creating

```bash
mkdir -v my_folder
```

*`-v` (verbose) prints a message for each directory created.*

---

## 5. Combine Options

```bash
mkdir -pv path/to/my_folder
```

*Creates all necessary parent folders and prints confirmation.*

---

## `mkdir` Cheatsheet

| Command                    | Description                              |
| -------------------------- | ---------------------------------------- |
| `mkdir folder`             | Create a single directory                |
| `mkdir -p a/b/c`           | Create nested directories recursively    |
| `mkdir -v folder`          | Verbose output when creating a directory |
| `mkdir -pv path/to/folder` | Create all folders in path + show output |

---

> 💡 **Tip**: Use `mkdir` together with `cd` to create and move into a new directory in one line:
>
> ```bash
> mkdir -p ~/projects/new && cd $_
> ```
>
> `$_` references the last argument of the previous command — handy for quick navigation.





