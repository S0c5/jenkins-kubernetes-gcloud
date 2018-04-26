#!/bin/bash
docker kill $(docker ps -q)
docker ps -a
#docker rmi $(docker images -q)