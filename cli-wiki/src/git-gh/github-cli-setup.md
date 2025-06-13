# GitHub CLI Workflow Guide (with SSH, PRs & Issues)

A beginner-friendly guide to working with **GitHub CLI (`gh`)**, including SSH setup, repositories, pull requests, and issues.

---

## What is GitHub and Why Use It?

**GitHub** is a web-based platform built on top of **Git**, the version control system. It allows developers and teams to:

* **Host code repositories** online
* **Collaborate** with others through pull requests and reviews
* **Track issues** and bugs with a built-in issue tracker
* **Deploy and automate** with GitHub Actions
* **Secure** and manage code using permissions, signed commits, and access controls

### Why Use GitHub?

| Benefit                | What It Means                                    |
| ---------------------- | ------------------------------------------------ |
| Centralized Hosting | Your code lives online, accessible anywhere      |
| Collaboration       | Teams can work together without overwriting work |
| Issue Tracking      | Manage bugs and feature requests with visibility |
| Pull Requests        | Code review workflow ensures clean, quality code |
| Version History     | Go back to any version of your code at any time  |
| CI/CD Integration   | Automate tests, builds, and deployments          |

> GitHub makes it easy to scale from solo projects to large enterprise teams.

---


## 1. Install GitHub CLI

**macOS:**

```bash
brew install gh
```

**Ubuntu/Debian:**

```bash
sudo apt install gh
```

Check it's working:

```bash
gh --version
```
> It will show the current version installed

---

## 2. Authenticate with GitHub (SSH)

```bash
gh auth login
```

Follow prompts:

* Select: `GitHub.com`
* Choose protocol: `SSH`
* Login method: `Login with browser`

---

## 3. Generate SSH Key (if needed)

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
> -t is encryption type and -C is comment

Save it to the default path and set a secure passphrase.

---

## 4. Add SSH Key to SSH Agent

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

---

## 5. Add SSH Key to GitHub

```bash
gh ssh-key add ~/.ssh/id_ed25519.pub --title "My Dev Machine"
```

---

## 6. (Optional) Add GPG Key for Signed Commits

If you've created a GPG key:

```bash
gpg --armor --export <GPG_KEY_ID> | gh gpg-key add -
```

Find your GPG key ID:

```bash
gpg --list-secret-keys --keyid-format=long
```

---

## 7. Verify Authentication

```bash
gh auth status        # View login method
ssh -T git@github.com # Test SSH
```

---

## 8. Create and Push a New Repo

```bash
mkdir my-app && cd my-app
git init
gh repo create my-app --public --source=. --remote=origin --push
```

---

## 9. Clone a Repo

```bash
gh repo clone username/repo-name
cd repo-name
```

---

## 10. Feature Branch + PR Workflow

```bash
git checkout -b feature/login
# Make changes
git add .
git commit -m "Add login feature"
git push -u origin feature/login
```

### Create a Pull Request

```bash
gh pr create --base main --head feature/login --title "Add login" --body "Implements login form"
```

### Merge PR (when approved)

```bash
gh pr merge 123 --merge       # Standard merge
# or
gh pr merge 123 --squash      # Combine all commits
```

> You can also use `gh pr merge` with no number if you're in the branch folder.

---

## 11. Manage Issues

### Create a New Issue

```bash
gh issue create --title "Bug: Login fails on Safari" --body "Steps to reproduce..."
```

### View Open Issues

```bash
gh issue list
```

### View a Specific Issue

```bash
gh issue view 42
```

### Comment on an Issue

```bash
gh issue comment 42 --body "Looking into this now!"
```

### Close an Issue

```bash
gh issue close 42
```

---

## 12. Git Commands Reference

Basic Git commands are **not covered here**.
See full Git guide → [git-commands.md](git-commands.md)

---

## GitHub CLI Cheatsheet

| Command                   | Description                              |
| ------------------------- | ---------------------------------------- |
| `gh auth login`           | Log in to GitHub                         |
| `gh repo create`          | Create a new repo (and push local files) |
| `gh repo clone user/repo` | Clone a repo using SSH                   |
| `gh pr create`            | Create a pull request                    |
| `gh pr list`              | List open pull requests                  |
| `gh pr view [id]`         | View a pull request                      |
| `gh pr merge [id]`        | Merge a pull request                     |
| `gh issue create`         | Open a new issue                         |
| `gh issue list`           | View issues                              |
| `gh issue comment`        | Add comment to issue                     |
| `gh issue close`          | Close an issue                           |
| `gh ssh-key add`          | Add SSH key to GitHub                    |
| `gh gpg-key add`          | Add GPG key to GitHub                    |



