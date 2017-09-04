# redmine install

# create db

```bash 

mkdir -p /srv/docker/redmine/postgresql
chcon -Rt svirt_sandbox_file_t !$

docker run --name=postgresql-redmine -d \
  --env='DB_NAME=redmine_prod' \
  --env='DB_USER=redmine' --env='DB_PASS=redmine' \
  --volume=/srv/docker/redmine/postgresql:/var/lib/postgresql \
  sameersbn/postgresql:9.6-2

```

# create redmine app

```bash

git clone https://github.com/ChatWorks/redmine.data /srv/docker/redmine/data
chcon -Rt svirt_sandbox_file_t !$

docker run --name=redmine -d \
  --link=postgresql-redmine:postgresql \
  --publish=10083:80 --env='REDMINE_PORT=10083' \
  --volume=/srv/docker/redmine/data:/home/redmine/data \
  sameersbn/redmine:3.3.0

```

# delete redmine plugin

```bash
# delete plugin
  docker run --name=redmine -it --rm \
  --link=postgresql-redmine:postgresql --publish=10083:80 \
  --env='REDMINE_PORT=10083' \
  --volume=/root/work/redmine.data:/home/redmine/data \
  sameersbn/redmine:3.3.0 \
  app:rake redmine:plugins:migrate NAME=redcase VERSION=0
```
