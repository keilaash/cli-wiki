# Docker CI/CD Guide
A practical guide to integrating Docker into your Continuous Integration and Deployment pipelines.


## What is CI/CD?
**CI/CD** stands for **Continuous Integration** and **Continuous Delivery** (or **Continuous Deployment**). It is a modern software development practice that enables teams to deliver code changes more frequently and reliably through automation.

- **Continuous Integration (CI)** is the practice of automatically building and testing code every time a team member commits changes to version control. This helps catch bugs early and ensures that the application is always in a deployable state.

- **Continuous Delivery (CD)** automates the process of delivering code to staging or production environments after successful tests. With CD, code changes can be pushed to production safely and quickly.

- **Continuous Deployment** takes CD a step further by automatically deploying every change that passes all stages of the pipeline to production without manual intervention.

### Benefits of CI/CD
- Faster development cycles
- Higher software quality
- Reduced manual errors
- Quicker feedback and recovery
- Consistent and repeatable deployments

CI/CD is a cornerstone of DevOps practices, promoting collaboration between development and operations teams, and enabling organizations to respond to market changes faster.


## Why Docker for CI/CD?
Docker simplifies CI/CD pipelines by offering:
- Consistent environments across build/test/deploy stages
- Isolation for dependencies and tools
- Portability across local, staging, and production
- Faster testing and deployment with containerized builds


## CI/CD Workflow Overview
1. **Build** Docker image from source
2. **Test** application inside a container
3. **Push** image to registry (Docker Hub, GitHub Container Registry, etc.)
4. **Deploy** container to target environment


## Prerequisites
- Docker installed locally or in your CI/CD environment
- A Dockerfile at the project root
- Docker Hub (or private registry) account
- GitHub/GitLab/CI tool of choice


## Sample Dockerfile
```Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```


## CI Example with GitHub Actions
Create `.github/workflows/docker.yml`:
```yaml
name: Docker CI

on:
  push:
    branches:
      - main

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v3

    - name: Log in to DockerHub
      uses: docker/login-action@v3
      with:
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}

    - name: Build and push Docker image
      uses: docker/build-push-action@v5
      with:
        context: .
        push: true
        tags: yourdockerhubuser/yourapp:latest
```

> Save DockerHub credentials in GitHub repo **Settings → Secrets** as `DOCKER_USERNAME` and `DOCKER_PASSWORD`.


## CI Example with GitLab CI/CD
Create `.gitlab-ci.yml`:

```yaml
stages:
  - build
  - deploy

variables:
  IMAGE_TAG: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA

build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD" $CI_REGISTRY
    - docker build -t $IMAGE_TAG .
    - docker push $IMAGE_TAG

deploy:
  stage: deploy
  script:
    - echo "Deploy logic goes here (e.g. docker-compose up, SSH to server, etc.)"
```

> GitLab will automatically set `$CI_REGISTRY`, `$CI_REGISTRY_IMAGE`, and `$CI_REGISTRY_USER`.


## Deploy with Docker Compose
Use `docker-compose.yml` on the target server:
```yaml
version: '3'
services:
  app:
    image: yourdockerhubuser/yourapp:latest
    ports:
      - "80:3000"
    restart: always
```

Deploy:
```bash
docker compose pull
docker compose up -d
```


## Directory Structure
```
project/
├── Dockerfile
├── .dockerignore
├── .github/
│   └── workflows/
│       └── docker.yml
├── .gitlab-ci.yml
└── src/
```


## Best Practices

- Pin image versions (`node:18-alpine`, not `node:latest`)
- Use `.dockerignore` to keep builds small
- Scan images for vulnerabilities (`docker scout quickview`)
- Use secrets in CI environments, not hardcoded passwords
- Automate deployment with version tags


## Bonus: Version Tagging
In your pipeline, you can tag builds by commit or semver:
```bash
docker tag yourapp:latest yourapp:v1.0.3
docker push yourapp:v1.0.3
```

Or dynamically in CI (example for GitHub):
```yaml
tags: youruser/yourapp:latest, youruser/yourapp:${{ github.sha }}
```


## Further Reading
- [Docker Official Docs](https://docs.docker.com/)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [GitLab CI/CD Docs](https://docs.gitlab.com/ee/ci/)
- [Docker Scout](https://docs.docker.com/scout/overview/)


