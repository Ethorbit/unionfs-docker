# docker-unionfs
Combine 2 host directories into a unionfs mount managed by a docker container.

## Environment Vars:
* `TZ` - The timezone the container will use (default: Etc/UTC)
* `PUID` - The merged mount's user ID (default: 1000)
* `PGID` - The merged mount's group ID (default: 1000)
* `UMASK` - The merged mount's umask (default: 0007)

## Usage:
<details>
    <summary>docker</summary>
    <code>
    `docker run -dit --name "ethorbit-and-bob-photos" --privileged --network=none --restart on-failure --env TZ="America/Los_Angeles" --env PUID=1000 --env PGID=1008 -v "/home/ethorbit/Pictures:/top:shared" -v "/home/bob/Pictures:/bottom:shared" -v "/mnt/photos-merged:/merged:shared" ethorbit/unionfs:latest`
    </code>
</details>
<details>
    <summary>docker-compose</summary>
    <code>
        ```yaml
        version: '3.9'
        services:
            unionfs_photos:
                image: ethorbit/unionfs:latest
                container_name: ethorbit-and-bob-photos 
                privileged: true
                network_mode: none
                environment:
                    TZ: 'America/Los_Angeles'
                    PUID: 1000 
                    PGID: 1008
                volumes:
                    - /home/ethorbit/Pictures:/top:shared
                    - /home/bob/Pictures:/bottom:shared 
                    - /mnt/photos-merged:/merged:shared 
                restart: unless-stopped
        ```
    </code>
</details>

This example combines the Pictures directory of users ethorbit and bob, who are both in a group with the id 1008, both of them can browse eachother's pictures at: /mnt/photos-merged
