# mysql-docker

Docker Compose for MySQL


## Quickstart

Spin up MySQL on docker

```bash
docker-compose up -d
```

List containers

```bash
docker-compose ps

NAME                IMAGE               COMMAND                  SERVICE             CREATED             STATUS              PORTS
mysql               mysql:5.7           "docker-entrypoint.s…"   db                  2 hours ago         Up 2 hours          0.0.0.0:3306->3306/tcp, 33060/tcp
```


Go into inside MySQL container

```bash
docker exec -it mysql /bin/bash
```

Execute the MySQL command inside the container

```bash
bash-4.2# mysql -u user -p

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
Server version: 5.7.42 MySQL Community Server (GPL)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```


Insert test tables and datas into db database


```bash
bash-4.2# cd /var/tmp
bash-4.2# mysql -u user -p db < examples/insert.sql 
```

