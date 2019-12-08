#!/usr/bin/bash
#Released under GPLv3, ¢ Filippo Falezza
CONTAINER_NAME=amazing_khorana
xhost +local:docker
docker start $CONTAINER_NAME
pid=$(docker inspect --format '{{.State.Pid}}' $CONTAINER_NAME)
while [ -d /proc/$pid ] ; do
    sleep 1
done
xhost -local:docker
