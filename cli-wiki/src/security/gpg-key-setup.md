# GPG Key Setup Guide for Git Commit Signing

This guide helps you **generate and configure a GPG key** so you can **sign your Git commits** and prove authorship.

---

## What is a GPG Key, and Why Use It?

**GPG (GNU Privacy Guard)** is a tool for secure communication and file encryption. In the context of Git:

* A **GPG key** is a **digital identity** made of a public and private key pair.
* You use your **private key** to **digitally sign Git commits**.
* Others (like GitHub) can verify your signature using your **public key**.

### Why Sign Commits?

* **Proves authorship**: Confirms the commit really came from *you*.
* **Increases trust**: “Verified” badge on GitHub helps collaborators trust your changes.
* **Protects integrity**: Ensures commits weren’t tampered with after you made them.

> Without GPG signing, anyone could technically commit using your name/email — and Git wouldn’t know the difference.

---

## 1. Install GPG

### macOS (with Homebrew)

```bash
brew install gnupg
```

### Ubuntu/Debian

```bash
sudo apt update && sudo apt install gnupg
```

> Confirm installation:

```bash
gpg --version
```

---

## 2. Generate a GPG Key

Run:

```bash
gpg --full-generate-key
```

Choose:

* **Key type**: `1` (RSA and RSA)
* **Key size**: `4096`
* **Expiration**: Set as needed (e.g., `1y` or `0` for no expiry)
* Input your **name**, **email**, and a **strong passphrase**

---

## 3. List Your GPG Keys

```bash
gpg --list-secret-keys --keyid-format LONG
```

Look for:

```
sec   rsa4096/0123ABCD4567EFGH 2025-06-12 [SC]
uid   [ultimate] Your Name <you@example.com>
```

Copy the key ID after `rsa4096/` — e.g., `0123ABCD4567EFGH`

---

## 4. Export Your Public GPG Key

```bash
gpg --armor --export 0123ABCD4567EFGH
```

Copy the entire output — it begins with:

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
```

---

## 5. Add GPG Key to GitHub

1. Go to [GitHub → Settings → SSH and GPG keys](https://github.com/settings/keys)
2. Click **"New GPG key"**
3. Paste your exported key
4. Click **"Add GPG key"**

---

## 6. Tell Git to Use Your GPG Key

```bash
git config --global user.signingkey 0123ABCD4567EFGH
git config --global commit.gpgsign true
```

If using GPG ≥ 2.1:

```bash
echo "use-agent" >> ~/.gnupg/gpg.conf
```

### macOS only: Pinentry fix (for keychain prompts)

```bash
brew install pinentry-mac
echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent
```

---

## 7. Test a Signed Commit

```bash
git commit -S -m "Test signed commit"
```

> GitHub will show a **“Verified”** label if the commit is properly signed.

---

## GPG Key Cheatsheet

| Command                                    | Description            |
| ------------------------------------------ | ---------------------- |
| `gpg --full-generate-key`                  | Generate new GPG key   |
| `gpg --list-secret-keys`                   | View your private keys |
| `gpg --armor --export <ID>`                | Export public key      |
| `git config --global user.signingkey <ID>` | Use key in Git         |
| `git commit -S -m "msg"`                   | Sign a Git commit      |
| `git config --global commit.gpgsign true`  | Auto-sign all commits  |
| `gpg --edit-key <ID>`                      | Manage a key           |
| `gpg --delete-keys <ID>`                   | Remove a public key    |
| `gpg --delete-secret-keys <ID>`            | Remove a private key   |



