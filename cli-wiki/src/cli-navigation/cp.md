# `cp` Command Guide for Copying Files and Directories

This guide helps you understand and use the `cp` (copy) command, which allows you to duplicate files and directories within a Unix-like file system.

---

## What is `cp`, and Why Use It?

The `cp` command is used to **copy files or folders** from one location to another. It’s a fundamental tool when you want to:

* Back up a file before modifying it
* Duplicate a configuration or script
* Copy data from one directory or disk to another

### Why Learn `cp`?

* **Efficient backups**: Quickly save a copy of critical files.
* **Non-destructive**: Unlike `mv`, `cp` leaves the original intact.
* **Supports options for safety**: Like asking before overwriting.

> You’ll frequently use `cp` when working with system files, scripts, or when preparing deployment directories.

---

## 1. Copy a File

```bash
cp source.txt destination.txt
```

* Duplicates `source.txt` as `destination.txt` in the same or different location.

---

## 2. Copy into a Directory

```bash
cp source.txt /path/to/directory/
```

* Copies `source.txt` into the specified folder.

---

## 3. Copy Multiple Files into a Directory

```bash
cp file1.txt file2.txt /target/folder/
```

* All listed files will be copied into the given folder.

---

## 4. Copy a Directory (Recursively)

```bash
cp -r my_folder/ /target/location/
```

* `-r` or `--recursive` lets you copy a whole folder, including its contents and subfolders.

---

## 5. Prompt Before Overwriting

```bash
cp -i file.txt /path/
```

* `-i` (interactive) asks you before replacing an existing file at the destination.

---

## 6. Preserve Timestamps and Permissions

```bash
cp -p file.txt /path/
```

* `-p` keeps the original file’s modification time, access time, and mode (permissions).

---

## 7. Verbose Mode (Show What’s Happening)

```bash
cp -v file.txt /path/
```

* `-v` (verbose) prints each file copied — useful for confirming what’s happening.

---

## Copy Cheatsheet

| Command                | Description                            |
| ---------------------- | -------------------------------------- |
| `cp a b`               | Copy file `a` to `b`                   |
| `cp a /dir/`           | Copy `a` into the specified directory  |
| `cp file1 file2 /dir/` | Copy multiple files into a folder      |
| `cp -r folder /dir/`   | Recursively copy a folder and contents |
| `cp -i file /dir/`     | Prompt before overwriting              |
| `cp -p file /dir/`     | Preserve timestamps and permissions    |
| `cp -v file /dir/`     | Show what’s being copied               |




