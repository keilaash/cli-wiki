# `cd` Command Guide for moving between directories(folders)

This guide helps you understand and use the `cd` (change directory) command, which is the core way to navigate through the filesystem in any Unix-like environment.

---

## What is `cd`, and Why Use It?

The `cd` command allows you to **move between directories (folders)** in the terminal. It's the fundamental way to navigate the Unix file system, which is organized as a tree starting from the root (`/`).

### Why Learn `cd`?

* **Navigate the system**: Move to configuration directories, user folders, or project files.
* **Access files faster**: Quickly reach your working directory.
* **Enable other commands**: Tools like `ls`, `git`, `scp`, or `cp` rely on being in the right location.
* **Work remotely**: On SSH sessions or servers without a GUI, `cd` is essential.

> Without `cd`, you're stuck in one folder — limiting your ability to explore or manage the system.

---

## 1. Basic Usage

```bash
cd /path/to/folder
```

* Changes the working directory to the specified absolute path.

Example:

```bash
cd /etc/nginx/
```

---

## 2. Navigate Using Relative Paths

```bash
cd ..
```

* `..` means “go up one level” from the current folder.

```bash
cd ../logs
```

* Moves up and into a sibling folder.

---

## 3. Shortcut to Home Directory

```bash
cd ~
```

* `~` refers to your home directory (e.g., `/home/yourname` on Linux).

```bash
cd
```

* Also takes you to your home directory.

---

## 4. Move Back to Previous Directory

```bash
cd -
```

* Returns you to the directory you were in before the last `cd` command.

---

## 5. Combine with `ls` for File Awareness

After navigating, use:

```bash
ls
```

* Lists the contents of the current directory so you can see what's inside.

---

## Related Navigation Tools

Understanding `cd` is only the beginning. You'll commonly use these commands together:

| Command | Description                             |
| ------- | --------------------------------------- |
| `ls`    | List contents of a directory            |
| `pwd`   | Show the current working directory path |
| `cp`    | Copy files or directories               |
| `mv`    | Move or rename files/folders            |
| `rm`    | Delete files or directories             |
| `mkdir` | Create a new directory                  |
| `rmdir` | Remove an empty directory               |

---

## Unix Filesystem Basics

Here’s a quick overview of the standard structure you’ll be navigating:

```
/
├── bin      → essential system programs
├── home     → user folders (e.g., /home/alice)
├── etc      → system configuration files
├── var      → logs, spool files, cache
├── usr      → shared and user-installed software
├── tmp      → temporary runtime files
```

> Every directory is part of this tree. You navigate it using `cd`, inspect it using `ls`, and interact with its contents using tools like `cp`, `mv`, and `rm`.

---

## Navigation Cheatsheet

| Command       | Description                    |
| ------------- | ------------------------------ |
| `cd path/`    | Move into a directory          |
| `cd ..`       | Go up one directory level      |
| `cd ~`        | Go to your home directory      |
| `cd -`        | Return to previous directory   |
| `pwd`         | Show current directory path    |
| `ls`          | List files and folders         |
| `cp a b`      | Copy file `a` to `b`           |
| `mv a b`      | Move or rename file `a` to `b` |
| `rm a`        | Delete file `a`                |
| `mkdir name/` | Make a new folder              |




