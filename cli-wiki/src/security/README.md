# Security

Guides related to security tools and practices, including:

## Access git based reporsitories securely
Secure access to GitHub is essential for maintaining the integrity, authenticity, and confidentiality of your code and development environment. Below are the recommended methods:

### 1. SSH Key Authentication

* Generate an SSH key pair and add the public key to your GitHub account.
* Authenticate securely without entering your GitHub credentials each time.
* **Ideal for**: Frequent Git users and automation scripts.

### 2. GPG Key Setup *(Recommended for Commit Signing)*

* Generate and configure GPG keys to cryptographically sign your commits.
* Signed commits verify that changes came from a trusted source—you.
* **Ideal for**: Open source contributors, teams with strict audit/compliance needs.

### 3. Personal Access Tokens (PATs)

* Used as an alternative to passwords when accessing GitHub over HTTPS.
* Scoped tokens provide controlled access to repositories or actions.
* **Ideal for**: CI/CD tools, automated scripts, or API integrations.

### 4. Two-Factor Authentication (2FA)

* Add an extra layer of security to your GitHub login using SMS or TOTP apps.
* Reduces risk from password compromise.
* **Essential for**: All users.

### Why Choose GPG for commit signing?

* **Verified Identity**: Signed commits show a verified badge on GitHub.
* **Audit Trail**: Helps teams track who made what changes, securely.
* **Defense Against Tampering**: Ensures the commit wasn't modified by a malicious actor before being merged or pulled.

> While GPG doesn’t secure repository *access* like SSH does, it secures the *integrity and authorship* of the content itself—making it especially useful in collaborative or regulated environments.


