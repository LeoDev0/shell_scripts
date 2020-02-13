#!/bin/bash

# Garante que o script só será executado por um usuário com privilégios root 
if [[ "${UID}" -ne 0 ]]
then
	echo 'Esse script deve ser executado com permissão de super usuário (root ou sudo)' >&2
	exit 1
fi

# Parar o servidor apache local
/etc/init.d/apache2 stop

# Parar o MySQL local
systemctl stop mysql

# Iniciar o servidor apache e o MySQL pelo XAMPP 
/opt/lampp/lampp start