# CLI Navigation

Understanding how to move around and manage files from the command line is fundamental in Unix-like systems such as Linux and macOS. Whether you're managing servers, using Git, writing shell scripts, or transferring files securely, basic CLI navigation is a universal prerequisite.

## How Navigation Works in Unix

Unix-like systems use a **hierarchical file structure**, beginning with a single root directory: `/`

From there, everything is organized like a tree:

```
/
├── bin      → essential binaries
├── home     → user directories (e.g., /home/alice)
├── etc      → configuration files
├── var      → variable data (logs, databases)
├── tmp      → temporary files
├── usr      → user-installed software
└── dev      → system devices
```

Each user typically operates within their own **home directory** (e.g., `/home/username`), which is represented by `~` (tilde).

Paths can be:

* **Absolute** (start with `/`) → `/etc/nginx/nginx.conf`
* **Relative** (from current directory) → `../logs/access.log`

You use commands like `cd` (change directory), `pwd` (print working directory), and `ls` (list contents) to navigate and inspect the filesystem.

---

## Common File Management Tools

Once you can move around, you'll often want to work with files:

| Tool    | Purpose                          |
| ------- | -------------------------------- |
| `cp`    | Copy files or directories        |
| `mv`    | Move or rename files and folders |
| `rm`    | Delete files or directories      |
| `mkdir` | Create new folders               |
| `rmdir` | Remove empty folders             |

These tools respect file structure and permissions, and many support options for working recursively (e.g., with entire folders), prompting confirmation, or preserving metadata.

---

## Why This Matters

Knowing how to navigate and manage the filesystem from the command line helps you:

* Run Git or SCP commands in the right folder
* Move or rename config files securely
* Understand system layouts when debugging
* Write shell scripts for automation
* Work effectively over SSH or in headless environments

> Even when using advanced tools, CLI navigation is the bedrock of working productively in any Unix-like system.




