# Docker Security Best Practices
Securing your Docker containers and host is critical in production environments. Below are some best practices to help keep your Docker environments secure.


## 1. Use Minimal Base Images
Choose minimal images like `alpine` to reduce the attack surface.


## 2. Run Containers as Non-Root Users
Avoid running containers as the root user. Use the `USER` directive in your Dockerfile.
```Dockerfile
FROM node:alpine
USER node
```


## 3. Use Docker Content Trust (DCT)
Enable DCT to ensure images are signed and verified.
```bash
export DOCKER_CONTENT_TRUST=1
```


## 4. Regularly Scan Images
Use tools like `docker scan`, `Trivy`, or `Clair` to scan for vulnerabilities.
```bash
docker scan your-image
```


## 5. Use Docker Secrets for Sensitive Data (Swarm Only)
Avoid hardcoding secrets in environment variables or files. Docker Swarm provides a secure way to manage sensitive data like API keys, passwords, and TLS certificates.

### Step 1: Initialise Docker Swarm
```bash
docker swarm init
```

### Step 2: Create a Secret
```bash
echo "supersecretvalue" | docker secret create my_secret -
```

### Step 3: Reference the Secret in docker-compose.yml
```yaml
version: '3.8'

services:
  app:
    image: myapp:latest
    secrets:
      - my_secret
    environment:
      SECRET_VALUE_FILE: /run/secrets/my_secret

secrets:
  my_secret:
    external: true
```

> **Warning:** Never store secrets directly in the `docker-compose.yml` using plain `environment:` variables. These values can be exposed in logs, command output, or version control. Use Docker secrets or an external secrets manager (e.g., Vault, AWS Secrets Manager) for secure secret management.


## 6. Limit Container Capabilities
Drop unnecessary Linux capabilities:
```yaml
cap_drop:
  - ALL
```


## 7. Use Read-Only Filesystems
Prevent modification by running containers with read-only file systems:
```bash
docker run --read-only ...
```


## 8. Avoid Mounting Docker Socket
Mounting `/var/run/docker.sock` gives root access to the host. Avoid this unless absolutely necessary.


## 9. Set Resource Limits
Limit memory and CPU usage per container.
```bash
docker run --memory=512m --cpus="1.0" ...
```


## 10. Network Segmentation
Use custom networks and avoid exposing unnecessary ports.


## 11. Keep Docker Updated
Always use the latest stable Docker release to benefit from the latest security patches.  

