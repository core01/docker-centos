# docker-centos
Docker (docker-compose) image with CentOS 7, NGINX, PHP7-FPM, LARAVEL & working systemd

How to use
-
- `git clone https://github.com/core01/docker-centos.git .`
- `cd docker-centos`
- Edit or add your own NGINX config and PHP config files in ./nginx & ./php
- Edit docker-compose.yml - replace `/home/core01/dev` with your path to webprojects & add extra_hosts
- Add your hosts to /etc/hosts on your host machine
- Run `docker-compose up -d`
- Enjoy.

TIPS
-
If you want to enter bash as user, you must use `docker exec --user core01 -it **CONTAINER_ID** bash` (replace core01 with your username and don't forget to change **useradd** in Dockerfile (use `id` command on host system to get id & gid of your current user)
