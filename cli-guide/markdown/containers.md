# Docker Command Wiki

A comprehensive guide to installing, managing, and using Docker containers.

## Installation

### Ubuntu/Debian

    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io

### CentOS/RHEL/Fedora

    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install docker-ce docker-ce-cli containerd.io

### macOS

Install Docker Desktop from https://docker.com/products/docker-desktop

### Windows

Install Docker Desktop from https://docker.com/products/docker-desktop

### Post-Installation Setup

Add your user to docker group (Linux):

    sudo usermod -aG docker $USER
    newgrp docker

Start Docker service:

    sudo systemctl start docker
    sudo systemctl enable docker

Verify installation:

    docker --version
    docker run hello-world

## Basic Container Operations

### Run a container

    docker run ubuntu

### Run container interactively

    docker run -it ubuntu bash

### Run container in background (detached)

    docker run -d nginx

### Run with custom name

    docker run --name my-nginx nginx

### Run with port mapping

    docker run -p 8080:80 nginx

### Run with volume mounting

    docker run -v /host/path:/container/path ubuntu

### Run with environment variables

    docker run -e MYSQL_ROOT_PASSWORD=mypassword mysql

### Run and remove when stopped

    docker run --rm ubuntu echo "Hello World"

## Container Management

### List running containers

    docker ps

### List all containers (including stopped)

    docker ps -a

### Stop a container

    docker stop container_name

### Start a stopped container

    docker start container_name

### Restart a container

    docker restart container_name

### Remove a container

    docker rm container_name

### Remove all stopped containers

    docker container prune

### Force remove a running container

    docker rm -f container_name

### Execute command in running container

    docker exec -it container_name bash

### Copy files to/from container

    docker cp file.txt container_name:/path/to/destination
    docker cp container_name:/path/to/file.txt ./local/path

### View container logs

    docker logs container_name

### Follow logs in real-time

    docker logs -f container_name

### View container resource usage

    docker stats

### Inspect container details

    docker inspect container_name

## Image Management

### List local images

    docker images

### Pull an image from registry

    docker pull ubuntu:20.04

### Remove an image

    docker rmi image_name

### Remove unused images

    docker image prune

### Remove all unused images

    docker image prune -a

### Build image from Dockerfile

    docker build -t my-app .

### Build with custom Dockerfile name

    docker build -t my-app -f custom.dockerfile .

### Tag an image

    docker tag source_image:tag target_image:tag

### Push image to registry

    docker push username/image_name:tag

### Search for images

    docker search nginx

### View image history

    docker history image_name

## Docker Compose

### Install Docker Compose (Linux)

    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

### Start services defined in docker-compose.yml

    docker-compose up

### Start services in background

    docker-compose up -d

### Stop services

    docker-compose down

### View running services

    docker-compose ps

### View logs

    docker-compose logs

### Follow logs

    docker-compose logs -f

### Rebuild and start services

    docker-compose up --build

### Scale a service

    docker-compose up --scale web=3

### Execute command in service

    docker-compose exec service_name bash

## Networking

### List networks

    docker network ls

### Create a network

    docker network create my-network

### Connect container to network

    docker network connect my-network container_name

### Disconnect container from network

    docker network disconnect my-network container_name

### Run container on specific network

    docker run --network my-network nginx

### Remove network

    docker network rm my-network

### Inspect network

    docker network inspect my-network

## Volumes

### List volumes

    docker volume ls

### Create a volume

    docker volume create my-volume

### Remove a volume

    docker volume rm my-volume

### Remove unused volumes

    docker volume prune

### Inspect volume

    docker volume inspect my-volume

### Run container with named volume

    docker run -v my-volume:/data ubuntu

### Run container with bind mount

    docker run -v /host/path:/container/path ubuntu

## Common Docker Setups

### Web Server (Nginx)

    docker run -d --name web-server -p 80:80 -v /path/to/html:/usr/share/nginx/html nginx

### Database (MySQL)

    docker run -d --name mysql-db -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=mydb -p 3306:3306 mysql:8.0

### Database (PostgreSQL)

    docker run -d --name postgres-db -e POSTGRES_PASSWORD=password -e POSTGRES_DB=mydb -p 5432:5432 postgres:13

### Redis Cache

    docker run -d --name redis-cache -p 6379:6379 redis:alpine

### WordPress with MySQL

    docker run -d --name wordpress-db -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress mysql:8.0
    docker run -d --name wordpress-site --link wordpress-db:mysql -p 8080:80 -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_NAME=wordpress -e WORDPRESS_DB_PASSWORD=password wordpress

### Node.js Application

    docker run -d --name node-app -p 3000:3000 -v /path/to/app:/usr/src/app -w /usr/src/app node:16 npm start

## Dockerfile Examples

### Basic Node.js Dockerfile

Create a file named `Dockerfile`:

    FROM node:16-alpine
    WORKDIR /usr/src/app
    COPY package*.json ./
    RUN npm install
    COPY . .
    EXPOSE 3000
    CMD ["npm", "start"]

Build and run:

    docker build -t my-node-app .
    docker run -p 3000:3000 my-node-app

### Basic Python Dockerfile

    FROM python:3.9-slim
    WORKDIR /app
    COPY requirements.txt .
    RUN pip install -r requirements.txt
    COPY . .
    EXPOSE 5000
    CMD ["python", "app.py"]

### Multi-stage Build Example

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

## Docker Compose Examples

### Basic docker-compose.yml

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

### WordPress with Docker Compose

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

## System Maintenance

### View Docker system info

    docker system info

### View disk usage

    docker system df

### Clean up everything

    docker system prune -a

### Clean up with volumes

    docker system prune -a --volumes

### Remove all containers

    docker rm -f $(docker ps -aq)

### Remove all images

    docker rmi -f $(docker images -q)

### Update all images

    docker images --format "table {{.Repository}}:{{.Tag}}" | tail -n +2 | xargs -L1 docker pull

## Registry Operations

### Login to Docker Registry

    docker login

### Login to private registry

    docker login registry.example.com

### Tag for registry

    docker tag my-app username/my-app:v1.0

### Push to registry

    docker push username/my-app:v1.0

### Pull from private registry

    docker pull registry.example.com/my-app:v1.0

## Troubleshooting

### Container won't start

Check logs:

    docker logs container_name

### Permission denied errors

Fix ownership (Linux):

    sudo chown -R $USER:$USER /path/to/files

### Port already in use

Find process using port:

    sudo lsof -i :8080

Kill process:

    sudo kill -9 PID

### Out of disk space

Clean up Docker:

    docker system prune -a --volumes

### Container runs but app doesn't work

Check if container is listening on correct port:

    docker exec container_name netstat -tlnp

### Can't connect to Docker daemon

Start Docker service:

    sudo systemctl start docker

Add user to docker group:

    sudo usermod -aG docker $USER

## Security Best Practices

### Run containers as non-root user

    docker run --user 1000:1000 ubuntu

### Limit container resources

    docker run --memory="256m" --cpus="1.0" ubuntu

### Use read-only filesystem

    docker run --read-only ubuntu

### Drop capabilities

    docker run --cap-drop=ALL --cap-add=NET_BIND_SERVICE nginx

### Scan images for vulnerabilities

    docker scout quickview image_name

### Use official images when possible

    docker pull nginx:alpine

## Performance Tips

### Use specific image tags

Instead of:

    docker pull nginx:latest

Use:

    docker pull nginx:1.21-alpine

### Use multi-stage builds

Reduces final image size by excluding build dependencies.

### Use .dockerignore

Create `.dockerignore` file to exclude unnecessary files:

    node_modules
    .git
    *.log
    .env

### Optimize layer caching

Place frequently changing instructions at the bottom of Dockerfile.

### Use Alpine images

    docker pull node:16-alpine

Smaller size than full distributions.

## Bash Tips for Docker

### Handle container names with spaces

Always quote container names:

    docker exec -it "my container name" bash

### Loop through containers

    for container in $(docker ps -q); do
        echo "Container: $container"
        docker exec $container ps aux
    done

### Conditional container operations

    if docker ps | grep -q nginx; then
        echo "Nginx is running"
    else
        docker run -d --name nginx nginx
    fi

### Save container logs

    docker logs container_name > container.log 2>&1

### Backup and restore containers

Export container:

    docker export container_name > backup.tar

Import container:

    docker import backup.tar my-image:latest

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
| `docker-compose up` | Start services |
| `docker-compose down` | Stop services |
| `docker system prune` | Clean up unused resources |
