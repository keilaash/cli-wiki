# Docker Containers: Essential Commands

Master the Docker CLI to build, run, and manage containers efficiently.

---

## 🔍 Inspecting Docker Environment

- `docker version`  
  Show Docker client and server versions.

- `docker info`  
  Get system-wide Docker information.

---

## 📦 Managing Images

- `docker images`  
  List locally available Docker images.

- `docker pull <image>`  
  Download image from Docker Hub.

- `docker rmi <image>`  
  Remove an image.

---

## 🚀 Running Containers

- `docker run <image>`  
  Run a container from an image.

- `docker run -it ubuntu bash`  
  Run Ubuntu interactively with a shell.

- `docker run -d -p 8080:80 nginx`  
  Detached Nginx server on port 8080.

---

## 🧭 Managing Running Containers

- `docker ps`  
  List running containers.

- `docker ps -a`  
  List all containers (including stopped).

- `docker stop <container>`  
  Gracefully stop a container.

- `docker kill <container>`  
  Force-stop a container.

- `docker start <container>`  
  Restart a stopped container.

---

## 🛠️ Exec and Logs

- `docker exec -it <container> bash`  
  Open a shell in a running container.

- `docker logs <container>`  
  View container logs.

---

## 🧹 Clean Up

- `docker rm <container>`  
  Remove a stopped container.

- `docker system prune`  
  Remove all unused containers, images, and networks.

