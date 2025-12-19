echo "== DAM-VIOD Xat =="
read -p "IP servidor: " server_ip
read -p "Port servidor: " server_port

read -p "Nom d'usuari: " username

# Quan es prem Ctrl + C, el programa envia BYE al servidor
trap 'echo "BYE $username" | nc -q 0 $server_ip $server_port 2>/dev/null; exit 0' SIGINT

# S'envia un missatge HELLO al servidor
echo "HELLO $username" | nc -q 0 $server_ip $server_port


echo -e "\n== Benvingut! =="
echo -e "\q per sortir\n"

while true
do
	read -p "($username): " message

	echo "$message"
	# Si l'input és \q, s'envia un missatge BYE al servidor i es tanca el programa
	if [ "$message" = "\q" ]; then
		echo "BYE $username" | nc -q 0 $server_ip $server_port
		break
	fi

	echo "MESSAGE $username $message" | nc -q 0 $server_ip $server_port

done

# Es tanca el programa satisfactòriament
exit 0
