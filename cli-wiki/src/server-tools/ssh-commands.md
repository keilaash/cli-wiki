# SSH Commands Guide

A quick reference for common SSH-related tasks.

## 1. Generate a New SSH Key

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

## 2. Add SSH Key to Agent

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

## 3. Test SSH Connection

```bash
ssh -T git@github.com
```

## 4. View SSH Public Key

```bash
cat ~/.ssh/id_ed25519.pub
```

## 5. Connect to Remote Server

```bash
ssh user@host
```

## 6. Copy SSH Key to Server

```bash
ssh-copy-id user@host
```

## 7. SSH Config File Example

File: `~/.ssh/config`

```ssh
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
```

---

## 🧠 SSH Cheatsheet

| Command | Description |
|--------|-------------|
| `ssh-keygen -t ed25519` | Create SSH key |
| `ssh-add <key>` | Add SSH key to agent |
| `ssh -T git@github.com` | Test GitHub SSH |
| `ssh user@host` | Connect to server |
| `ssh-copy-id user@host` | Copy key to server |
| `cat ~/.ssh/id_ed25519.pub` | Show public key |
| `~/.ssh/config` | SSH connection shortcuts |
