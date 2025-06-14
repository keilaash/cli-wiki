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

## Prerequisites

Before using SCP, you must:

### 1. Ensure SSH is Installed

#### On Linux/macOS (usually pre-installed):

```bash
ssh -V
```

#### On Windows (PowerShell 7+ or Git Bash):

```powershell
ssh -V
```

> If not installed, install OpenSSH from Windows Features or [Git for Windows](https://git-scm.com/downloads)

---

### 2. Generate an SSH Key (if needed)

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

> When prompted for a **passphrase**, you can either:
>
> * Leave it empty (less secure, but no password prompts), or
> * Set a passphrase (recommended), and follow step 3 to avoid repeated prompts.

---

### 3. Add SSH Key to SSH Agent

This step ensures your key is **unlocked once per session**, and avoids repeated password prompts.

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

> If your key has a **passphrase**, you'll be asked to enter it **once** here. After that, the agent keeps it in memory.

---

### 4. Copy Your SSH Key to the Remote Server

```bash
ssh-copy-id user@server-ip
```

> This adds your public key to the remote server so you can connect without a password.

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
scp file.txt user@server-ip:/path/to/destination/
```

> Sends `file.txt` from your computer to a directory on the remote machine

---

## 3. Copy a File from Remote to Local

```bash
scp user@server-ip:/path/to/file.txt /local/destination/
```

> Downloads a file from the remote machine to your current directory

---

## 4. Copy a Directory Recursively

```bash
scp -r my_folder user@server-ip:/path/to/destination/
```

> `-r` allows you to copy an entire folder and its contents

---

## 5. Use a Specific Port

```bash
scp -P 2222 file.txt user@server-ip:/path/
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
scp -p file.txt user@server-ip:/path/
```

> Keeps the original timestamps and modes (permissions)

---

## 8. Increase Verbosity (Debugging)

```bash
scp -v file.txt user@server-ip:/path/
```

> Shows detailed output of the copy process — helpful for troubleshooting

---

## SCP Cheatsheet

| Command                               | Description                         |
| ------------------------------------- | ----------------------------------- |
| `scp file user@server-ip:/path/`         | Copy file to remote                 |
| `scp user@server-ip:/file ./`            | Copy file from remote               |
| `scp -r dir user@server-ip:/path/`       | Recursively copy directory          |
| `scp -P 2222 file user@server-ip:/path/` | Use specific port                   |
| `scp -p file user@server-ip:/path/`      | Preserve timestamps and permissions |
| `scp -v file user@server-ip:/path/`      | Verbose output for debugging        |




