# MV Command Guide for Moving and Renaming Files

This guide helps you understand and use the `mv` (move) command to move or rename files and directories in Unix-like systems.

---

## What is `mv`, and Why Use It?

The `mv` command is used to **move** files or directories from one location to another — or to **rename** them.

### Why Learn `mv`?

* **File organization**: Move files into appropriate folders.
* **Renaming**: Quickly rename files without needing a dedicated rename tool.
* **Efficient**: Unlike `cp`, `mv` doesn’t duplicate — it relocates or renames in-place.

> Because `mv` *replaces* files by default, it’s often paired with safety flags like `-i` to avoid accidental overwrites.

---

## 1. Rename a File

```bash
mv oldname.txt newname.txt
```

* Changes the file name without changing its location.

---

## 2. Move a File to a Directory

```bash
mv file.txt /path/to/destination/
```

* Moves `file.txt` into the specified folder.

---

## 3. Move Multiple Files into a Directory

```bash
mv file1.txt file2.txt /destination/
```

* Places both files into the target directory.

---

## 4. Move a Directory

```bash
mv my_folder /new/location/
```

* Moves the folder and everything inside it to a new path.

---

## 5. Prompt Before Overwriting

```bash
mv -i file.txt /path/
```

* `-i` (interactive) asks before replacing any existing files.

---

## 6. Verbose Mode (Show What’s Happening)

```bash
mv -v file.txt /path/
```

* `-v` (verbose) displays each operation — helpful when working with many files.

---

## Move Cheatsheet

| Command                    | Description                       |
| -------------------------- | --------------------------------- |
| `mv a.txt b.txt`           | Rename `a.txt` to `b.txt`         |
| `mv file.txt /dir/`        | Move file to directory            |
| `mv file1 file2 /dir/`     | Move multiple files into a folder |
| `mv -i file /dir/`         | Ask before overwriting            |
| `mv -v file /dir/`         | Show each move operation          |
| `mv folder /new/location/` | Move directory and its contents   |




