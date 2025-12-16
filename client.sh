read -p "IP servidor: " server_ip
read -p "Port servidor: " server_port

read -p "Nom d'usuari: " username

while true
do
	read -p "Missatge a enviar: " message
	echo $message | nc $server_ip $server_port
done
