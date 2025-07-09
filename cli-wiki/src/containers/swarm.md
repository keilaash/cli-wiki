## Docker Swarm
**Docker Swarm** is Docker’s native clustering and orchestration tool. It lets you manage a **group of Docker hosts (nodes)** as a single, virtual Docker engine, enabling scaling, high availability, and fault tolerance.

With Docker Swarm, you can:
* Run the same services across multiple machines
* Automatically distribute containers (called **services**) across nodes
* Scale services up or down easily
* Deploy a full application stack using a single file (`docker-compose.yml`)
* Maintain zero-downtime updates via rolling deployments

> Think of Swarm as a **self-organising, load-balanced Docker cluster**.


### Swarm Basics
#### Initialise a Swarm
```bash
docker swarm init
```

* Promotes your current machine to a **manager node**
* Outputs a `docker swarm join` command for other nodes

#### Join a Swarm (Worker or Manager)
```bash
docker swarm join --token <token> <manager-ip>:2377
```

> Get the token using:
```bash
docker swarm join-token worker
docker swarm join-token manager
```

#### Leave a Swarm
```bash
docker swarm leave
```

> Force-leave if manager:
```bash
docker swarm leave --force
```


### Node Management

#### List Swarm Nodes
```bash
docker node ls
```

#### Inspect a Node
```bash
docker node inspect <node-id>
```

#### Drain a Node (prevent it from running containers)
```bash
docker node update --availability drain <node-id>
```

#### Re-enable a Node
```bash
docker node update --availability active <node-id>
```

#### Promote/Demote Manager/Worker
```bash
docker node promote <node-id>
docker node demote <node-id>
```


### Services
**Services** are the units of scheduling in Swarm — like containers, but designed to scale and self-heal across the cluster.

#### Create a Service
```bash
docker service create --name web --replicas 3 -p 80:80 nginx
```

#### List Services
```bash
docker service ls
```

#### Inspect a Service
```bash
docker service inspect <service-name>
```

#### View Service Tasks (like individual containers)
```bash
docker service ps <service-name>
```

#### Update a Service
```bash
docker service update --image nginx:alpine web
```

#### Scale a Service
```bash
docker service scale web=5
```

#### Remove a Service
```bash
docker service rm web
```


## Further Reading
- [Docker Swarm Guide](https://docs.docker.com/engine/swarm/swarm-tutorial/)


## Docker Swarm Cheat Sheet
| Task                      | Command |
|---------------------------|---------|
| Init swarm                | `docker swarm init` |
| Join swarm                | `docker swarm join` |
| List nodes                | `docker node ls` |
| Drain a node              | `docker node update --availability drain <id>` |
| Promote node              | `docker node promote <id>` |
| Demote node               | `docker node demote <id>` |
| Create service            | `docker service create --name web -p 80:80 nginx` |
| Scale service             | `docker service scale web=3` |
| Remove service            | `docker service rm web` |

