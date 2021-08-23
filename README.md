### Hexlet tests and linter status:
[![Actions Status](https://github.com/FominSergiy/devops-for-programmers-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/FominSergiy/devops-for-programmers-project-lvl1/actions)

[![ci](https://github.com/FominSergiy/devops-for-programmers-project-lvl1/actions/workflows/push.yml/badge.svg)](https://github.com/FominSergiy/devops-for-programmers-project-lvl1/actions/workflows/push.yml)

# Overview
Repo contains two `docker-compose` yml files:

- `docker-compose.override.yml` - build that contains a strapi ap, an Caddy reverse proxy and a Postgres db
- `docker-compose.yml`  - used to run manual and ci tests

- `Dockerfile.production` - docker image published on docker hub

# Running

> `Makefile` describes commands used to run docker-compose commands in this repo

## Run Tests
```Bash
$ make ci
```

## Run Container
After running this command our strapi app will be available on `localhost` or `localhost/admin`
```Bash
$ make compose-up
```

# Docker Hub Image
```Bash
$ docker pull 4132043212/devops-for-programmers-project-lvl1
```

# Requirements
- Docker version 20.10.7
    - [Mac-Microsoft]https://www.docker.com/get-started
    - [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

# Troubleshoot issues
Sometimes when running `$ make ci` you might get the following error:

```Bash
app_1  | npm ERR! code ENOENT
app_1  | npm ERR! syscall open
app_1  | npm ERR! path /app/package.json
app_1  | npm ERR! errno -2
app_1  | npm ERR! enoent ENOENT: no such file or directory, open '/app/package.json'
app_1  | npm ERR! enoent This is related to npm not being able to find a file.
app_1  | npm ERR! enoent 
app_1  | 
app_1  | npm ERR! A complete log of this run can be found in:
app_1  | npm ERR!     /root/.npm/_logs/2021-08-23T13_26_47_376Z-debug.log
```

in that case do the following:
1. run `$ docker image ls`
2. find the image that was created

```Bash
REPOSITORY                                       TAG       IMAGE ID       CREATED        SIZE
4132043212/devops-for-programmers-project-lvl1   latest    b283dfed3157   2 days ago     943MB
```

3. delete the image `$ docker image rm <img-id> -f`
4. run `$ make ci`
5. tests results should pass

```Bash
app_1  | 
app_1  | > app@0.1.0 test /app
app_1  | > jest tests/root.test.js
app_1  | 
app_1  | PASS tests/root.test.js
app_1  |   ✓ mom i am engineer (4 ms)
app_1  | 
app_1  | Test Suites: 1 passed, 1 total
app_1  | Tests:       1 passed, 1 total
app_1  | Snapshots:   0 total
app_1  | Time:        0.588 s
app_1  | Ran all test suites matching /tests\/root.test.js/i.
```