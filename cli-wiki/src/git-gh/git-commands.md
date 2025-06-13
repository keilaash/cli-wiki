# Git Commands Guide

A practical, beginner-friendly reference for essential Git commands and workflows.

---

## What is Git?

**Git** is a tool that lets you **track changes to files** (usually code) and **collaborate with others**. It's called a **version control system**, and it's widely used in software development.

With Git, you can:

- Save your work at different points
- Go back to earlier versions
- Work with a team without overwriting each other’s changes

Git works locally on your computer but also connects to remote services like GitHub.

---

## 1. Install Git

Before using Git, install it:

- **Linux (Debian/Ubuntu):**

  ```bash
  sudo apt update
  sudo apt install git
- **macOS (with Homebrew):**

  ```bash
  brew install git
  ```

- **Windows**:
  Download from [https://git-scm.com/downloads](https://git-scm.com/downloads)

After installation, check that it worked:

```bash
git --version
```
> It should show the current installed version

---

## 2. Set Up Git

Tell Git who you are (this shows up in commits):

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

You only need to do this once.

---

## 3. Start a Project

### Option 1: Clone an Existing Project

If the code already exists online (like on GitHub):

```bash
git clone https://github.com/user/repo.git
cd repo
```

### Option 2: Start a New Local Project

If you're creating a new project:

```bash
mkdir my-project
cd my-project
git init
```

> This creates a hidden `.git` folder that tracks changes.

---

## 4. Check Project Status

See which files have changed:

```bash
git status
```

* **Untracked**: Git doesn’t know about the file yet
* **Staged**: Ready to be saved which usually happens after git add
* **Modified**: Changed but not yet staged

---

## 5. Stage and Commit Changes

Save a snapshot of your work:

```bash
git add .                       # Stage all changes
git commit -m "Describe your change"
```

> For git commit, use a clear message to explain what you did.

You can also add a detailed description:

```bash
git commit -m "Add login button" -m "Includes styles and click handler"
```
> first -m is for header second -m is for more details  

You can sign commit messages using [GPG keys](../security/gpg-key-setup.md) (which can be created locally) with (-S):

```bash
git commit -S -m "Add login button" -m "Includes styles and click handler"
```

---


## 6. Connect to a Remote (if repo was initialized and not cloned)

If you started with `git init`, add a remote:

```bash
git remote add origin https://github.com/yourname/project.git
git remote -v  # Confirm remote is set
```

Push for the first time:

```bash
git push -u origin main
```

> `-u` sets this as the default remote for future pushes.

---

## 7. Push Changes

After the first push, you can just use:

```bash
git push
```

> This sends your committed changes to the remote branch.

---

## 8. Pull Updates

Get changes from the remote repository (need to pull before subsequent update to reposetory):

```bash
git pull
```

> Always pull before pushing to avoid conflicts.

---

## 9. Branching

Create a new branch to work separately from `main`:

```bash
git checkout -b feature-login # feature-login is branch name
```
> -b for branch

> Example use case : making a new feature that is not ready to be implemented into the main branch

While working on sub-branch use this command to switch back to the main branch:

```bash
git checkout main
```

---

## 10. Merging

Merge changes from one branch A into branch B where branch A is derived from branch B. For example, branch B can be the main branch:

```bash
git checkout main
git merge feature-login
```

> Resolve any conflicts if prompted.

---

### 10a. Merge Conflicts

**When**: You and someone else changed the same line.

Git will mark the file like:

```text
<<<<<<< HEAD
your version
=======
their version
>>>>>>> branch-name
```

**Steps to fix:**

1. Edit the file to resolve the conflict
2. Stage and commit:

```bash
git add resolved_file
git commit -m "Resolve conflict"
```

## 11. View History

See what’s been done and when:

```bash
git log                       # Detailed history
git log --oneline --graph     # Compact visual format
```

---

## 12. Stash Temporary Work

Save unfinished changes:

```bash
git stash
```

Bring them back later into the local repository being worked on:

```bash
git stash pop
```

---

## 13. Undo Mistakes

Revert a commit (safe):

```bash
git revert <commit-hash>
```
### What is a Commit Hash?

Every Git commit has a unique **ID** called a **commit hash** — a long string of letters and numbers that looks like:

```
a3c9e83b2d7ff1e9855a6e4b9b7297f0637b59f8
```

* It uniquely identifies a snapshot of your project.
* You can use it to **undo**, **view**, or **refer to** specific commits.

---

### How to Find the Commit Hash

Run:

```bash
git log
```

You’ll see output like:

```
commit a3c9e83b2d7ff1e9855a6e4b9b7297f0637b59f8
Author: Your Name <your_email@example.com>
Date:   Fri Jun 14 12:00:00 2024

    Add login feature
```

The long string after `commit` is the **commit hash**.

---

Reset to a previous state (dangerous):


```bash
git reset --hard a3c9e83
```

* Moves your branch back to that commit
* **Deletes all commits after it**
* Use only if you're sure (and haven’t pushed yet)


> Be careful — this permanently removes history.

---


## Real-World Examples

Start a new project and push it

```bash
mkdir project
cd project
git init
git remote add origin https://github.com/you/project.git
# Add files and commit
git add .
git commit -m "Initial commit"
git push -u origin main
```

---

Fix a typo and push

```bash
nano README.md
git add README.md
git commit -m "Fix typo"
git push
```

---

Create, Push, and Merge a Feature Branch

```bash
git checkout -b feature/login        # Create and switch to a new feature branch

# Make changes to your code
git add .                            # Stage all changes
git commit -m "Add login feature"    # Commit your work

git push -u origin feature/login     # Push the branch and set upstream
```

After finishing your feature:

```bash
git checkout main                    # Switch to the main branch
git pull origin main                 # Make sure main is up to date
git merge feature/login              # Merge the feature branch into main
git push origin main                 # Push the updated main branch (origin main is assuming it is first time)
```


---

Revert a broken commit

```bash
git log             # Find the hash
git revert abc1234
```

---

Stash changes to update main

```bash
git stash
git pull
git stash pop
```

---

## Git Cheatsheet

| Command                       | What it Does                                |
| ----------------------------- | ------------------------------------------- |
| `git init`                    | Start a new Git repo                        |
| `git clone <URL>`             | Copy a remote repo                          |
| `git status`                  | Show current file states                    |
| `git add .`                   | Stage all changes                           |
| `git commit -m ""`            | Save changes with a message                 |
| `git checkout -b <branch>`    | Create and switch to a new branch           |
| `git push -u origin <branch>` | Push a branch and set upstream (first push) |
| `git pull origin main`        | Fetch and merge changes from remote main    |
| `git merge <branch>`          | Merge another branch into the current one   |
| `git push origin main`        | Push your changes to the remote main branch |
| `git stash`                   | Temporarily store local changes             |
| `git stash pop`               | Re-apply stashed changes                    |
| `git reset --hard <commit>`   | Remove commits and changes (destructive)    |
| `git revert <commit>`         | Undo a commit safely by creating a new one  |
| `git log`                     | View full commit history                    |
| `git log --oneline --graph`   | Compact history with branch visualization   |
| `git remote -v`               | Show connected remotes                      |
| `git remote add origin <URL>` | Add a new remote to your repo               |


