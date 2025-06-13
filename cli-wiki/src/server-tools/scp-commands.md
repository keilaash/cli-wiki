# SCP Key Setup Guide for Secure File Transfers

This guide helps you use **SCP (Secure Copy Protocol)** to securely transfer files between your local machine and a remote server, or between two remote systems.

---

## What is SCP, and Why Use It?

**SCP** is a secure command-line tool to **copy files over SSH**. It encrypts both the files and any authentication information during transfer.

### Why Use SCP?

* Securely transfer files over the internet
* Works with any server that supports SSH
* Simple syntax for fast file operations
* No need for setting up FTP or other services

---

## 1. Basic Syntax

```bash
scp [options] source destination
```

You can copy:

* From local → remote
* From remote → local
* Between two remote servers

---

## 2. Copy a File from Local to Remote

```bash
scp file.txt user@remote:/path/to/destination/
```

> Sends `file.txt` from your computer to a directory on the remote machine

---

## 3. Copy a File from Remote to Local

```bash
scp user@remote:/path/to/file.txt /local/destination/
```

> Downloads a file from the remote machine to your current directory

---

## 4. Copy a Directory Recursively

```bash
scp -r my_folder user@remote:/path/to/destination/
```

> `-r` allows you to copy an entire folder and its contents

---

## 5. Use a Specific Port

```bash
scp -P 2222 file.txt user@remote:/path/
```

> If your SSH server runs on a non-default port (not 22), specify it with `-P`

---

## 6. Copy Between Two Remote Hosts

```bash
scp user1@host1:/path/file.txt user2@host2:/path/
```

> Useful for transferring files directly between two remote servers

---

## 7. Preserve File Attributes

```bash
scp -p file.txt user@remote:/path/
```

> Keeps the original timestamps and modes (permissions)

---

## 8. Increase Verbosity (Debugging)

```bash
scp -v file.txt user@remote:/path/
```

> Shows detailed output of the copy process — helpful for troubleshooting

---

## SCP Cheatsheet

| Command                               | Description                         |
| ------------------------------------- | ----------------------------------- |
| `scp file user@remote:/path/`         | Copy file to remote                 |
| `scp user@remote:/file ./`            | Copy file from remote               |
| `scp -r dir user@remote:/path/`       | Recursively copy directory          |
| `scp -P 2222 file user@remote:/path/` | Use specific port                   |
| `scp -p file user@remote:/path/`      | Preserve timestamps and permissions |
| `scp -v file user@remote:/path/`      | Verbose output for debugging        |




