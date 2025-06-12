# GPG Key Setup Guide

This guide helps you generate and configure a GPG key for signing your Git commits.

## 1. Install GPG

**macOS**
```bash
brew install gnupg
```

**Ubuntu/Debian**
```bash
sudo apt update && sudo apt install gnupg
```

## 2. Generate a GPG Key

```bash
gpg --full-generate-key
```

- Choose: `1` (RSA and RSA)
- Key size: `4096`
- Expiration: Choose as needed
- Enter your **name**, **email**, and **passphrase**

## 3. List GPG Keys

```bash
gpg --list-secret-keys --keyid-format LONG
```

Copy the GPG key ID (e.g., `0123ABCD4567EFGH`)

## 4. Export Public Key

```bash
gpg --armor --export 0123ABCD4567EFGH
```

## 5. Add GPG Key to GitHub

- Go to [GitHub > Settings > SSH and GPG keys](https://github.com/settings/keys)
- Paste the **exported** key into "New GPG key"

## 6. Configure Git to Sign with GPG

```bash
git config --global user.signingkey 0123ABCD4567EFGH
git config --global commit.gpgsign true
```

## 7. Test Signed Commit

```bash
git commit -S -m "My signed commit"
```

---

## 🔑 GPG Key Cheatsheet

| Command | Description |
|--------|-------------|
| `gpg --full-generate-key` | Create new GPG key |
| `gpg --list-secret-keys` | List your secret keys |
| `gpg --armor --export <ID>` | Export public key |
| `git config --global user.signingkey <ID>` | Set signing key |
| `git commit -S -m "msg"` | Create signed commit |
