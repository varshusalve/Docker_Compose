# docker-compose

Tutorial: [Get started with Docker Compose](https://docs.docker.com/compose/gettingstarted/)

## How can I start my services in the background?

```bash
docker compose up -d
```

## How can I see what environment variables are available to the $SERVICE service defined in my docker-compose file?

```bash
SERVICE=web
docker compose run $SERVICE env
```

Note how this creates a container and then exists
```
$ docker ps -a
CONTAINER ID   IMAGE                COMMAND                  CREATED          STATUS                     PORTS     NAMES
0352eb7204cf   docker-compose_web   "env"                    2 seconds ago    Exited (0) 1 second ago              docker-compose_web_run_cf43592bca36
567aa67651ab   docker-compose_web   "env"                    3 minutes ago    Exited (0) 3 minutes ago             docker-compose_web_run_a506a07db24
```

## How can I stop services running in the background?

```
docker compose stop
```

## How can I bring everything down, removing the containers entirely? What if I also want to remove the data volume?

```
docker compose down
```
And to also remove the data volume:
```bash
docker compose down --volumes
```

## Will stopping (ctrl+C or `docker compose stop`) remove containers?

No, the containers just exit. `docker compose down` will remove the containers. The stopped container is why the counter will remain the same when runing `docker compose up` in a loop while stopping it each time, the data remains the redis container.
