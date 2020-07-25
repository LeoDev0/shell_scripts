#!/bin/bash

# Garante que o script só vai ser executado por superusuário
if [[ "${UID}" -ne 0 ]]
then
	sudo "$0" "$@"
fi

clear
echo Parando todos os containers...
docker stop $(docker ps -a -q)
sleep 0.5
echo " "

echo Destruindo todos os containers...
docker rm $(docker ps -a -q)
sleep 0.5
echo " "

echo Destruindo todas as imagens...
docker rmi $(docker images -a -q)

