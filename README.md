# uup-dump_docker
A docker image to run uupdump standalone

> [!IMPORTANT]
> It is possible that the repo will not contain the most recent uupdump data because it cannot be ruled out that if a lot changes elsewhere, this container may not function.
> 
> **Therefore, there is no guarantee of functionality over a longer period of time.**

# Tags

| Image | Tag | Build | Latest |
|:------------------:|:--------------:|:-----------------:|:-----------------:|
| ghcr.io/lizenzfass78851/uup-dump_docker | main | [![Build and Publish Docker Image](https://github.com/LizenzFass78851/uup-dump_docker/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/LizenzFass78851/uup-dump_docker/actions/workflows/docker-image.yml) | 📌 |

## To run with docker-compose

```bash
git clone https://github.com/LizenzFass78851/uup-dump_docker uupdump --single-branch --depth 1
cd uupdump
nano docker-compose.yml # if you want to override any default value
docker compose up -d
```

## To build and run with docker-compose (including Git submodules)

```bash
git clone https://github.com/LizenzFass78851/uup-dump_docker uupdump --single-branch --depth 1
cd uupdump
git submodule update --init --recursive
nano docker-compose.yml # if you want to override any default value
docker compose up -d --build
```

## information

- The [uupdump sta source code](https://github.com/LizenzFass78851/uup-dump_website/tree/sta) comes from the MDL forums

- The idea of merging this with docker is mine and not related to the uupdump developers
