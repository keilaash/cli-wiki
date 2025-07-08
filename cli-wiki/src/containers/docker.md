# Docker Command Guide
A comprehensive guide to installing, managing, and using Docker containers.


## What is Docker?
**Docker** is a tool that lets you **package applications into containers** — lightweight, portable environments that run consistently across machines.

With Docker, you can:

* Package code, dependencies, and system tools into one unit
* Run the same app on your laptop, server, or cloud
* Avoid "it works on my machine" problems
* Test, scale, and deploy software faster

Docker helps developers **isolate applications** and **ship them with confidence**.

> Think of a container as a box with everything your app needs to run — regardless of where it's deployed.


## Installation

### Ubuntu/Debian
```bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
```

### CentOS/RHEL/Fedora
```bash
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
```

## Arch Linux
```bash
sudo pacman -Syu docker
```

## Void Linux
```bash
sudo xbps-install -S docker
sudo ln -s /etc/sv/docker /var/service/docker
```

## Alpine Linux
```bash
sudo apk update
sudo apk add docker
sudo rc-update add docker boot
```

## Gentoo
```bash
sudo emerge --ask app-containers/docker
sudo rc-update add docker default
sudo /etc/init.d/docker start
```

## NixOS
Enable Docker in your configuration file (`/etc/nixos/configuration.nix`):
```nix
virtualisation.docker.enable = true;
```

Then apply the changes:
```bash
sudo nixos-rebuild switch
```

## OpenSUSE (Tumbleweed / Leap)
```bash
sudo zypper refresh
sudo zypper install docker
```

## Generic Linux (via Docker convenience script)
For unsupported or minimal distros:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

### macOS
Install Docker Desktop from [https://docker.com/products/docker-desktop](https://docker.com/products/docker-desktop)

### Windows
Install Docker Desktop from [https://docker.com/products/docker-desktop](https://docker.com/products/docker-desktop)

### Post-Installation Setup
Add your user to docker group (Linux):

```bash
sudo usermod -aG docker $USER
newgrp docker
```

Start Docker service:
```bash
sudo systemctl start docker
sudo systemctl enable docker
```

Verify installation:
```bash
docker --version # shows currently installed version
docker run hello-world
```


## Basic Container Operations
### Run a container
```bash
docker run ubuntu
```

### Run container interactively
```bash
docker run -it ubuntu bash
```

### Run container in background (detached)
```bash
docker run -d nginx
```

### Run with custom name
```bash
docker run --name my-nginx nginx
```

### Run with port mapping
```bash
docker run -p 8080:80 nginx
```

### Run with volume mounting
```bash
docker run -v /host/path:/container/path ubuntu
```

### Run with environment variables
```bash
docker run -e MYSQL_ROOT_PASSWORD=mypassword mysql
```

### Run and remove when stopped
```bash
docker run --rm ubuntu echo "Hello World"
```


## Container Management

### List running containers
```bash
docker ps
```

### List all containers (including stopped)
```bash
docker ps -a
```

### Stop a container
```bash
docker stop container_name
```

### Start a stopped container
```bash
docker start container_name
```

### Restart a container
```bash
docker restart container_name
```

### Remove a container
```bash
docker rm container_name
```

### Remove all stopped containers
```bash
docker container prune
```

### Force remove a running container
```bash
docker rm -f container_name
```

### Execute command in running container
```bash
docker exec -it container_name bash
```

### Copy files to/from container
```bash
docker cp file.txt container_name:/path/to/destination
docker cp container_name:/path/to/file.txt ./local/path
```

### View container logs
```bash
docker logs container_name
```

### Follow logs in real-time
```bash
docker logs -f container_name
```

### View container resource usage
```bash
docker stats
```

### Inspect container details
```bash
docker inspect container_name
```


## Image Management

### List local images
```bash
docker images
```

### Pull an image from registry
```bash
docker pull ubuntu:20.04
```

### Remove an image
```bash
docker rmi image_name
```

### Remove unused images
```bash
docker image prune
```

### Remove all unused images
```bash
docker image prune -a
```

### Build image from Dockerfile
```bash
docker build -t my-app .
```

### Build with custom Dockerfile name
```bash
docker build -t my-app -f custom.dockerfile .
```

### Tag an image
```bash
docker tag source_image:tag target_image:tag
```

### Push image to registry
```bash
docker push username/image_name:tag
```

### Search for images
```bash
docker search nginx
```

### View image history
```bash
docker history image_name
```


## Docker Compose

### Install Docker Compose (Linux)
```bash
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### Start services defined in docker-compose.yml
> **Note:** docker-compose command has been depricated. Use docker compose instead.

```bash
docker compose up
```

### Start services in background
```bash
docker compose up -d
```

### Stop services
```bash
docker compose down
```

### View running services
```bash
docker compose ps
```

### View logs
```bash
docker compose logs
```

### Follow logs
```bash
docker compose logs -f
```

### Rebuild and start services
```bash
docker compose up --build
```

### Scale a service
```bash
docker compose up --scale web=3
```

### Execute command in service
```bash
docker compose exec service_name bash
```


## Networking

### List networks
```bash
docker network ls
```

### Create a network
```bash
docker network create my-network
```

### Connect container to network
```bash
docker network connect my-network container_name
```

### Disconnect container from network
```bash
docker network disconnect my-network container_name
```

### Run container on specific network
```bash
docker run --network my-network nginx
```

### Remove network
```bash
docker network rm my-network
```

### Inspect network
```bash
docker network inspect my-network
```


## Volumes

### List volumes
```bash
docker volume ls
```

### Create a volume
```bash
docker volume create my-volume
```

### Remove a volume
```bash
docker volume rm my-volume
```

### Remove unused volumes
```bash
docker volume prune
```

### Inspect volume
```bash
docker volume inspect my-volume
```

### Run container with named volume
```bash
docker run -v my-volume:/data ubuntu
```

### Run container with bind mount
```bash
docker run -v /host/path:/container/path ubuntu
```


## Common Docker Setups

### Web Server (Nginx)
```bash
docker run -d --name web-server -p 80:80 -v /path/to/html:/usr/share/nginx/html nginx
```

### Database (MySQL)
```bash
docker run -d --name mysql-db -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=mydb -p 3306:3306 mysql:8.0
```

### Database (PostgreSQL)
```bash
docker run -d --name postgres-db -e POSTGRES_PASSWORD=password -e POSTGRES_DB=mydb -p 5432:5432 postgres:13
```

### Redis Cache
```bash
docker run -d --name redis-cache -p 6379:6379 redis:alpine
```

### WordPress with MySQL
```bash
docker run -d --name wordpress-db -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress mysql:8.0
docker run -d --name wordpress-site --link wordpress-db:mysql -p 8080:80 -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_NAME=wordpress -e WORDPRESS_DB_PASSWORD=password wordpress
```

### Node.js Application
```bash
docker run -d --name node-app -p 3000:3000 -v /path/to/app:/usr/src/app -w /usr/src/app node:16 npm start
```


## Dockerfile Examples

### Basic Node.js Dockerfile
Create a file named `Dockerfile`:
```dockerfile
FROM node:16-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

Build and run:
```bash
docker build -t my-node-app .
docker run -p 3000:3000 my-node-app
```

### Basic Python Dockerfile
```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]
```

### Multi-stage Build Example
```dockerfile
FROM node:16 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

---

## Docker Compose Examples

### Basic docker-compose.yml
```yaml
version: '3.8'
services:
  web:
    image: nginx
    ports:
      - "80:80"
    volumes:
      - ./html:/usr/share/nginx/html
  
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: myapp
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:
```

### WordPress with Docker Compose
```yaml
version: '3.8'
services:
  wordpress:
    image: wordpress:latest
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: password
      WORDPRESS_DB_NAME: wordpress
    depends_on:
      - db
  
  db:
    image: mysql:8.0
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: password
      MYSQL_ROOT_PASSWORD: rootpassword
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:
```

>**Note:** adding secrets such as passwords in docker compose file is **not secure**. It is advised to use a secrets manager (eg. docker secrets) to store secrets or store secrets in the .env directory.


## System Maintenance

### View Docker system info
```bash
docker system info
```

### View disk usage
```bash
docker system df
```

### Clean up everything
```bash
docker system prune -a
```

### Clean up with volumes
```bash
docker system prune -a --volumes
```

### Remove all containers
```bash
docker rm -f $(docker ps -aq)
```

### Remove all images
```bash
docker rmi -f $(docker images -q)
```

### Update all images
```bash
docker images --format "table {{.Repository}}:{{.Tag}}" | tail -n +2 | xargs -L1 docker pull
```

---

## Registry Operations

### Login to Docker Registry
```bash
docker login
```

### Login to private registry
```bash
docker login registry.example.com
```

### Tag for registry
```bash
docker tag my-app username/my-app:v1.0
```

### Push to registry
```bash
docker push username/my-app:v1.0
```

### Pull from private registry
```bash
docker pull registry.example.com/my-app:v1.0
```


## Troubleshooting

### Container won't start
Check logs:
```bash
docker logs container_name
```

### Permission denied errors
Fix ownership (Linux):
```bash
sudo chown -R $USER:$USER /path/to/files
```

### Port already in use
Find process using port:
```bash
sudo lsof -i :8080
```

Kill process:
```bash
sudo kill -9 PID
```

### Out of disk space
Clean up Docker:
```bash
docker system prune -a --volumes
```

### Container runs but app doesn't work
Check if container is listening on correct port:
```bash
docker exec container_name netstat -tlnp
```

### Can't connect to Docker daemon
Start Docker service:
```bash
sudo systemctl start docker
```

Add user to docker group:
```bash
sudo usermod -aG docker $USER
```


## Security Best Practices
### Run containers as non-root user
```bash
docker run --user 1000:1000 ubuntu
```

### Limit container resources
```bash
docker run --memory="256m" --cpus="1.0" ubuntu
```

### Use read-only filesystem
```bash
docker run --read-only ubuntu
```

### Drop capabilities
```bash
docker run --cap-drop=ALL --cap-add=NET_BIND_SERVICE nginx
```

### Scan images for vulnerabilities
```bash
docker scout quickview image_name
```

### Use official images when possible
```bash
docker pull nginx:alpine
```


## Performance Tips
### Use specific image tags
Instead of:
```bash
docker pull nginx:latest
```

Use:
```bash
docker pull nginx:1.21-alpine
```

### Use multi-stage builds
Reduces final image size by excluding build dependencies.

### Use .dockerignore
Create `.dockerignore` file to exclude unnecessary files:
```
node_modules
.git
*.log
.env
```

### Optimize layer caching
Place frequently changing instructions at the bottom of Dockerfile.

### Use Alpine images
```bash
docker pull node:16-alpine
```

Smaller size than full distributions.


## Common Workflows

### Development Workflow
```bash
# 1. Create Dockerfile
nano Dockerfile

# 2. Build image
docker build -t my-app .

# 3. Run container
docker run -d -p 8080:80 --name my-app-container my-app

# 4. Check logs
docker logs my-app-container

# 5. Update and rebuild
docker stop my-app-container
docker rm my-app-container
docker build -t my-app .
docker run -d -p 8080:80 --name my-app-container my-app
```

### Production Deployment
```bash
# 1. Pull latest code
git pull origin main

# 2. Build production image
docker build -t my-app:prod .

# 3. Stop old container
docker stop my-app-prod

# 4. Remove old container
docker rm my-app-prod

# 5. Start new container
docker run -d --name my-app-prod -p 80:8080 my-app:prod
```


## Quick Reference
| Command | Description |
|---------|-------------|
| `docker run -it` | Run interactively |
| `docker run -d` | Run in background |
| `docker ps` | List running containers |
| `docker ps -a` | List all containers |
| `docker stop` | Stop container |
| `docker rm` | Remove container |
| `docker images` | List images |
| `docker rmi` | Remove image |
| `docker exec -it` | Execute command in container |
| `docker logs` | View container logs |
| `docker build` | Build image from Dockerfile |
| `docker compose up` | Start services |
| `docker compose down` | Stop services |
| `docker system prune` | Clean up unused resources |  


