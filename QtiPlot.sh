#!/usr/bin/bash
#Released under GPLv3, ¢ Filippo Falezza
xhost +local:docker
docker start amazing_khorana
pid=$(docker inspect --format '{{.State.Pid}}' amazing_khorana)
while [ -d /proc/$pid ] ; do
    sleep 1
done
xhost -local:docker
return 0
