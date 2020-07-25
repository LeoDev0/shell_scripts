#!/bin/bash

# Força o script a rodar apenas com permissão de super usuário. Uma outra opção ainda mais curta seria:
# [ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
if [[ "${UID}" -ne 0 ]]
then
	echo Você precisa dar permissões de super usuário para rodar este script
	exec sudo bash "$0" "$@"
fi


CONTAINERS="$(docker ps -a -q)"
IMAGES="$(docker images -a -q)"


clear
if test -z $CONTAINERS
then
	echo Não há containers na máquina
else
    NUMBER_OF_CONTAINERS="$(docker ps -a -q | wc -l)"

	echo Parando todos os containers ativos...
	docker stop $(docker ps -a -q)
	sleep 0.5
	echo " "

	echo "Destruindo todos os $NUMBER_OF_CONTAINERS containers..."
	docker rm $(docker ps -a -q)
	sleep 0.5
	echo " "
fi

if test -z $IMAGES
then
	echo Não há imagens na máquina
else
    NUMBER_OF_IMAGES="$(docker images -a -q | wc -l)"

	echo "Destruindo todas as $NUMBER_OF_IMAGES imagens..."
	docker rmi $(docker images -a -q)
fi
