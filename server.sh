#!/bin/bash

server_ip=`ip a | grep "scope global" | xargs | cut -d " " -f 2 | cut -d "/" -f 1`
port=50000

echo "== DAM-VIOD Xat =="
echo "IP: $server_ip"
echo "Port: $port"

echo -e "\nCtrl + C per sortir"
echo "== Missatges rebuts =="

while true
do
	# -l escolta el port, -v mostra més missatge, -n mostra la direcció en format IP
	output=$(nc -l -v -n $port 2>&1)

	# Extreu la IP de la línia "Connection received ..." i el 4t paràmetre
	client_ip=$(echo "$output" | grep "Connection received" | cut -d " " -f 4)
	# Es guarda a $message, l'úlltima lÍnia d'$output
	message=$(echo "$output" | tail -n1)

	header=$(echo "$message" | cut -d " " -f 1)
	user=$(echo "$message" | cut -d " " -f 2)

	case "$header" in
	    HELLO)
	        echo "--> ${user}@${client_ip} s'ha unit al xat"
	        ;;
	    MESSAGE)
		input_user=$(echo "$message" | cut -d " " -f 3)

		echo "($user): $input_user"
	        ;;
	    BYE)
	        echo "--> ${user}@${client_ip} ha abandonat el xat"
	        ;;
	    *)
	        echo "Capçalera desconeguda"
	        ;;
	esac

done
