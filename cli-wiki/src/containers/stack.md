### Stack Basics

#### Deploy a Stack

```bash
docker stack deploy -c docker-compose.yml mystack
```

> Must be in Swarm mode (`docker swarm init` required)

#### List Stacks

```bash
docker stack ls
```

#### List Services in a Stack

```bash
docker stack services mystack
```

#### List Tasks (containers) in a Stack

```bash
docker stack ps mystack
```

#### Remove a Stack

```bash
docker stack rm mystack
```

---

### Example `docker-compose.yml` for Stack

```yaml
version: '3.8'
services:
  web:
    image: nginx
    ports:
      - "80:80"
    deploy:
      replicas: 3
      restart_policy:
        condition: on-failure
      placement:
        constraints: [node.role == worker]

  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: password
    volumes:
      - db_data:/var/lib/mysql
    deploy:
      placement:
        constraints: [node.role == manager]

volumes:
  db_data:
```

### Deploy This Stack

```bash
docker stack deploy -c docker-compose.yml mystack
```

---

### Stack Tips

* **Use `deploy:` section** to define Swarm-specific settings (replicas, placement, restart policies, etc.)
* **Avoid `build:`** in production stacks — use pre-built images.
* Ensure all nodes have access to required **networks**, **volumes**, or **images**.
* Stacks do **not support all docker-compose features** — e.g., no `depends_on` or `condition:` directives in Swarm.

---

## Docker stack deployment vs Compose

| Feature               | `docker-compose`     | `docker stack deploy`      |
| --------------------- | -------------------- | -------------------------- |
| Designed for          | Local development    | Swarm clusters             |
| Deploys to            | Single Docker daemon | Multiple Swarm nodes       |
| Orchestration         | No                   | Yes (replication, updates) |
| Rolling updates       | ❌                    | ✅                          |
| Service restart logic | Minimal              | Advanced                   |
| Networking            | Bridge               | Overlay                    |



