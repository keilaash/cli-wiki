# Git Commands Guide

A quick, practical reference for essential Git commands and workflows.

---

## 🔧 1. Setup Git

Before using Git, set your identity:

```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

### ✅ Why?

So your commits are tagged with your name and email.

---

## 📁 2. Initialize a Repository

Start a new Git project:

```bash
git init
```

### ✅ Why?

Creates a `.git` folder to track changes in your project.

---

## 🌐 3. Clone a Repository

Copy an existing repo to your machine:

```bash
git clone https://github.com/user/repo.git
```

### ✅ Scenario:

You're contributing to a project on GitHub.

---

## 🔍 4. Check Status

See what's changed:

```bash
git status
```

### ✅ Use this:

To check staged, unstaged, or untracked files before committing.

---

## 💾 5. Track and Commit Changes

Stage and commit your work:

```bash
git add .                     # Stage all changes
git commit -m "Short summary" -m "Detailed description"
```

### ✅ Tip:

Use two `-m` flags to add both a title and description.

---

## 📜 6. View Commit History

Review previous work:

```bash
git log
```

### ✅ Why?

To track who changed what, and when.

---

## 🌿 7. Branching

Work on features independently:

```bash
git branch new-branch       # Create a branch
git checkout new-branch     # Switch to it
git checkout -b feature-x   # Create and switch in one step
```

### ✅ Scenario:

You’re developing a new feature without affecting the main code.

---

## 🔀 8. Merging Branches

Bring changes together:

```bash
git checkout main
git merge feature-x
```

### ✅ Tip:

Always test your changes before merging.

---

## 🌍 9. Remote Repositories

Connect your local repo to a remote:

```bash
git remote -v                  # View current remotes
git remote add origin <URL>   # Add a new remote
```

---

## 🚀 10. Push and Pull

Sync with the remote repository:

```bash
git push origin main
git pull origin main
```

### ✅ Tip:

Pull before you push to avoid merge conflicts.

---

## 💼 11. Stashing Changes

Save work temporarily:

```bash
git stash        # Save changes
git stash pop    # Re-apply them later
```

### ✅ Scenario:

You need to switch branches but aren't ready to commit.

---

## ♻️ 12. Reset and Revert

Undo changes carefully:

```bash
git reset --hard HEAD~1      # Remove last commit (destructive)
git revert <commit-hash>     # Safely undo a commit
```

### ⚠️ Use with caution:

`reset --hard` deletes history. Prefer `revert` when in doubt.

---

Absolutely — merge and pull conflicts are super common in Git workflows, so including a clear guide in your wiki will be helpful. Here's an updated **"Troubleshooting & Practical Examples"** section with dedicated help for both:

---

## 🛠️ Troubleshooting & Practical Examples

### 🧩 Common Issues

#### 🔐 `fatal: not a git repository`

**Fix**: You’re trying to run Git commands outside a Git project. Run this inside your project directory:

```bash
git init
```

#### 🚫 `Permission denied (publickey)`

**Fix**: Your SSH key isn’t being used for GitHub. Test with:

```bash
ssh -T git@github.com
```

If denied, try:

```bash
ssh-add ~/.ssh/id_ed25519
```

#### ⚠️ Merge Conflicts

**When**: Happens during `merge` or `pull` when two branches change the same lines.

**Steps to Fix:**

1. Git marks the conflicting sections in the file like this:

   ```text
   <<<<<<< HEAD
   your local change
   =======
   incoming change
   >>>>>>> branch-name
   ```
2. Manually edit and resolve the conflicts.
3. Mark as resolved and commit:

   ```bash
   git add conflicted_file
   git commit
   ```

#### 🔄 Pull Conflicts

**When**: You try `git pull` but local changes conflict with remote updates.

**Fix Options**:

* **Option 1**: Stash your changes first:

  ```bash
  git stash
  git pull origin main
  git stash pop
  ```
* **Option 2**: Commit your changes before pulling:

  ```bash
  git add .
  git commit -m "Save work before pulling"
  git pull origin main
  ```

---

### 📌 Real-World Examples

#### ✅ Clone and start a feature

```bash
git clone https://github.com/username/project.git
cd project
git checkout -b feature/new-ui
```

#### ✅ Fix a typo and push

```bash
nano README.md
git add README.md
git commit -m "Fix typo in README"
git push origin feature/new-ui
```

#### ✅ Revert a broken commit

```bash
git log               # Find the commit hash
git revert abc1234    # Revert safely (non-destructive)
```

#### ✅ Stash changes to update main

```bash
git stash
git pull origin main
git stash pop
```

#### ✅ Handle merge conflicts

```bash
git merge feature/login
# resolve conflicts in file
git add resolved_file
git commit -m "Resolve merge conflict"
```

---


## 🧰 Git Cheatsheet

| Command                    | What it Does                  |
| -------------------------- | ----------------------------- |
| `git init`                 | Start a new Git repo          |
| `git clone <URL>`          | Copy a remote repo            |
| `git status`               | Show current file states      |
| `git add .`                | Stage all changes             |
| `git commit -m ""`         | Save changes with a message   |
| `git checkout -b <branch>` | Create and switch to a branch |
| `git merge <branch>`       | Merge another branch          |
| `git push` / `git pull`    | Sync with remote repo         |
| `git stash`                | Temporarily store changes     |
| `git reset` / `git revert` | Undo commits or changes       |


