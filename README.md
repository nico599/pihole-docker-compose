## pihole-docker

this repository is to capture a working configuration of pi-hole DNS filter

## required packages

-docker
-docker-compose*
-docker-ce*

for example:

```sh
docker-buildx-plugin/bookworm,now 0.20.0-1~debian.12~bookworm amd64 [installed,upgradable to: 0.21.0-1~debian.12~bookworm]
docker-ce-cli/bookworm,now 5:27.5.1-1~debian.12~bookworm amd64 [installed,upgradable to: 5:28.0.0-1~debian.12~bookworm]
docker-ce-rootless-extras/bookworm,now 5:27.5.1-1~debian.12~bookworm amd64 [installed,upgradable to: 5:28.0.0-1~debian.12~bookworm]
docker-ce/bookworm,now 5:27.5.1-1~debian.12~bookworm amd64 [installed,upgradable to: 5:28.0.0-1~debian.12~bookworm]
docker-compose-plugin/bookworm,now 2.32.4-1~debian.12~bookworm amd64 [installed,upgradable to: 2.33.0-1~debian.12~bookworm]
docker-compose/stable,now 1.29.2-3 all [installed]
docker/stable,now 1.5-2 all [installed]
```

## docker-compose 

The main configuration is in this file it is recommended to review it.

## upgrade.sh

This takes care of upgrading, and will stop and start services as required.

Beware that this attempts to cleanup docker images, could be destructive on shared hosts.

## configuration

This creates an application available at the IP you configure for $SERVERIP in .env

## .env

this holds the following key items:

WEBPASSWORD=examplepass
SERVERIP=192.168.1.53

# pihole_fs

create this folder in the current working directory if it doesnt exist, or map elsewhere in docker-compose.