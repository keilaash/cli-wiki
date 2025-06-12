# SCP Commands Guide

Secure Copy Protocol (SCP) is used to transfer files securely between a local and a remote host, or between two remote hosts.

## 1. Basic Syntax

```bash
scp [options] source destination
```

## 2. Copy a File from Local to Remote

```bash
scp file.txt user@remote:/path/to/destination/
```

## 3. Copy a File from Remote to Local

```bash
scp user@remote:/path/to/file.txt /local/destination/
```

## 4. Copy a Directory Recursively

```bash
scp -r my_folder user@remote:/path/to/destination/
```

## 5. Use a Specific Port

```bash
scp -P 2222 file.txt user@remote:/path/
```

## 6. Copy Between Two Remote Hosts

```bash
scp user1@host1:/path/file.txt user2@host2:/path/
```

## 7. Preserve File Attributes

```bash
scp -p file.txt user@remote:/path/
```

## 8. Increase Verbosity (Debug)

```bash
scp -v file.txt user@remote:/path/
```

---

## 📦 SCP Cheatsheet

| Command | Description |
|---------|-------------|
| `scp file user@remote:/path/` | Copy file to remote |
| `scp user@remote:/file ./` | Copy file from remote |
| `scp -r dir user@remote:/path/` | Recursively copy directory |
| `scp -P 2222 file user@remote:/path/` | Use specific port |
| `scp -p file user@remote:/path/` | Preserve timestamps |
| `scp -v file user@remote:/path/` | Verbose mode for debugging |
