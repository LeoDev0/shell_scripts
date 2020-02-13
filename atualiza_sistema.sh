#!/bin/bash

# Garante que o script só será executado por um usuário com privilégios root 
if [[ "${UID}" -ne 0 ]]
then
	echo 'Esse script deve ser executado com permissão de super usuário (root ou sudo)' >&2
	exit 1
fi

clear
while true;do
# clear
echo " "
echo " "
echo " "
echo "SEJA BEM-VINDO AO $0"
echo " "
echo "O que deseja fazer?
      
      1 - Atualizar repositórios do sistema.
      2 - Mostrar atualizações pendentes no sistema.
      3 - Atualizar repositórios e mostrar as atualizações disponíveis.
      4 - Atualizar repositórios e instalar atualizações caso existam.
      5 - Instalar atualizações do sistema.
      6 - Limpar o sistema.
      7 - Remover pacotes não necessários.
      0 - Sair"
echo " "
echo -n "Opção escolhida: "
read opcao
clear
case $opcao in
	1) 
		echo Verificando o sistema por atualizações...
		sleep 1
		apt update
		;;
	2)
		echo Mostrando as atualizações do sistema...
		sleep 1
		apt list --upgradable
		;;
	
	3)
		echo Atualizando os repositórios...
		sleep 1
		apt update
		echo " "
		echo Procurando atualizações pendentes...
		sleep 1
		apt list --upgradable
		;;

	4)
		echo Atualizando os repositórios...
		sleep 1
		apt update
		echo " "
		echo Instalando atualizações...
		sleep 1
		apt upgrade -y
		;;
	5)
		echo Instalando atualizações do sistema...
		sleep 1
		apt upgrade -y
		;;
	6)
		echo Limpando o sistema...
		apt clean
		apt autoclean
		;;
	7) 
		echo Removendo pacotes desnecessários do sistema...
		sleep 1
		apt autoremove -y
		;;
	0)
		echo Saindo...
		sleep 0.3
		exit 0
		;;
		
	*)
		echo Opção inválida, tente novamente.
		;;
esac
done
