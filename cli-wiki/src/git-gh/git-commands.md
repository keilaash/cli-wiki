# Git Commands Guide

A quick reference for essential Git commands and workflows.

## 1. Setup Git

```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

## 2. Initialize a Repository

```bash
git init
```

## 3. Clone a Repository

```bash
git clone https://github.com/user/repo.git
```

## 4. Check Status

```bash
git status
```

## 5. Track and Commit Changes

```bash
git add .           # Stage all changes
git commit -m "Commit message"
```

## 6. View Commit History

```bash
git log
```

## 7. Branching

```bash
git branch new-branch       # Create branch
git checkout new-branch     # Switch to branch
git checkout -b feature-x   # Create and switch
```

## 8. Merging Branches

```bash
git checkout main
git merge feature-x
```

## 9. Remote Repositories

```bash
git remote -v                 # Show remotes
git remote add origin URL     # Add remote
```

## 10. Push and Pull

```bash
git push origin main
git pull origin main
```

## 11. Stashing Changes

```bash
git stash           # Save changes
git stash pop       # Re-apply saved changes
```

## 12. Reset and Revert

```bash
git reset --hard HEAD~1      # Delete last commit
git revert <commit-hash>     # Undo a commit safely
```

---

## 🧰 Git Cheatsheet

| Command | Description |
|--------|-------------|
| `git init` | Initialize repo |
| `git clone URL` | Clone repo |
| `git status` | View changes |
| `git add .` | Stage changes |
| `git commit -m ""` | Commit changes |
| `git checkout -b <branch>` | Create/switch branch |
| `git merge <branch>` | Merge into current branch |
| `git push` / `git pull` | Sync with remote |
| `git stash` | Save work in progress |
| `git reset` / `git revert` | Undo changes |
