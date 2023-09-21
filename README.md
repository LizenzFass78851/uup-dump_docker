# uup-dump_docker
A docker image to run uupdump standalone

#### This repository is no longer maintained 
- **Reason:** [uup-dump-get-fileinfo+packs](uupdump/linux-uupdump-get-fileinfo%2Bpacks.sh) script is no longer available in the complex version as in version v1.5.2 (see mdl forum from uupdump) as it is only available for windows.



## just enter the following command to run it:

````
git clone https://github.com/LizenzFass78851/uup-dump_docker uupdump
docker-compose up -d
````

# Tags

| Image | Tag | Build |
|:------------------:|:--------------:|:-----------------:|
| ghcr.io/lizenzfass78851/uup-dump_docker | main | [![Build and Publish Docker Image](https://github.com/LizenzFass78851/uup-dump_docker/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/LizenzFass78851/uup-dump_docker/actions/workflows/docker-image.yml) |


## information

- The [uupdump sta source code](https://github.com/LizenzFass78851/uup-dump_website/tree/sta) comes from Paul on the MDL forums

- The idea of merging this with docker is mine and not related to the uupdump developers
