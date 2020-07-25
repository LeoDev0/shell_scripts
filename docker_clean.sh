#!/bin/bash

# Força o script a rodar apenas com permissão de super usuário. Uma outra opção ainda mais curta seria:
# [ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
if [[ "${UID}" -ne 0 ]]
then
	echo Você precisa dar permissões de super usuário para rodar este script
	exec sudo bash "$0" "$@"
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
