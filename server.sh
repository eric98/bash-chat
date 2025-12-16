#!/bin/bash

current_ip=`ip a | grep "scope global" | xargs | cut -d " " -f 2 | cut -d "/" -f 1`
port=5555

echo "== DAM-VIOD Xat =="
echo "IP: $current_ip"
echo "Port: $port"

echo -e "\nEscriu en el teu client:"
echo "echo \"missatge\" | nc $current_ip $port"
echo -e "\nCtrl + C per sortir\n"

echo -e "== Missatges rebuts =="

while true
do
	# El programa escolta el següent missatge
	nc -l 5555
done
