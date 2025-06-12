# GitHub CLI Setup with SSH and GPG

Set up GitHub CLI (`gh`), SSH authentication, and GPG key signing for GitHub.

## 1. Install GitHub CLI

**macOS**
```bash
brew install gh
```

**Ubuntu/Debian**
```bash
sudo apt install gh
```

## 2. Authenticate with GitHub

```bash
gh auth login
```

Follow the prompts:
- Choose GitHub.com
- Authenticate with browser
- Set protocol: `SSH`

## 3. Generate SSH Key

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Save to: `~/.ssh/id_ed25519`  
Set a secure passphrase.

## 4. Add SSH Key to SSH Agent

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

## 5. Add SSH Key to GitHub

```bash
gh ssh-key add ~/.ssh/id_ed25519.pub --title "My Dev Machine"
```

## 6. Add GPG Key to GitHub (Optional)

If you've created a GPG key (see GPG guide):

```bash
gpg --armor --export <GPG_KEY_ID> | gh gpg-key add -
```

## 7. Verify Setup

```bash
gh auth status
ssh -T git@github.com
```

---

## ⚙️ GitHub CLI + SSH Cheatsheet

| Command | Description |
|--------|-------------|
| `gh auth login` | Log in to GitHub |
| `ssh-keygen -t ed25519` | Create SSH key |
| `ssh-add ~/.ssh/id_ed25519` | Add SSH key to agent |
| `gh ssh-key add <path>` | Add SSH key to GitHub |
| `gh gpg-key add -` | Add GPG key via pipe |
| `gh auth status` | Check authentication status |
| `ssh -T git@github.com` | Test SSH connection |
