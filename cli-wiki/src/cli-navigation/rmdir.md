# `rmdir` Command Guide for Removing Empty Directories

This guide covers how to use `rmdir` to **delete empty directories** in Unix/Linux systems.

---

## What is `rmdir`, and Why Use It?

The `rmdir` (remove directory) command is used to **delete empty directories**. It's a safer alternative to `rm -r` when you're sure the folder is empty and want to avoid accidental data loss.

### Why Use `rmdir`?

* **Safe deletion**: Only removes empty directories
* **Useful in scripts**: Ensures no unintended data removal
* **Encourages cleanup**: Helps you maintain a tidy filesystem

> If the directory is **not empty**, `rmdir` will not delete it.

---

## 1. Remove a Single Empty Directory

```bash
rmdir my_folder
```

*Deletes `my_folder` if it contains no files or subdirectories.*

---

## 2. Remove Multiple Empty Directories

```bash
rmdir folder1 folder2 folder3
```

*Attempts to delete all listed folders, skipping any that aren't empty.*

---

## 3. Remove Directory Tree (Only if All Are Empty)

```bash
rmdir -p path/to/my_folder
```

*`-p` removes the directory and its parents if **all** are empty.*

### Example:

```bash
rmdir -p projects/demo/2025
```

Will remove:

* `projects/demo/2025`
* `projects/demo` *(if empty)*
* `projects` *(if empty)*

---

## `rmdir` Cheatsheet

| Command                   | Description                             |
| ------------------------- | --------------------------------------- |
| `rmdir folder`            | Remove a single empty directory         |
| `rmdir folder1 folder2`   | Remove multiple empty directories       |
| `rmdir -p path/to/folder` | Remove folder and its empty parent dirs |



