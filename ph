#/bin/bash

##################
# CONNECTION TOOLS
##################
. ph.conf

open_home_port() {
	for PORT in OPEN_PORTS
	do
		echo >/dev/tcp/${HOST}/${PORT} &> /dev/null && echo 'knocked $PORT'
	done
}

function close_home_port() {
	for PORT in CLOSE_PORTS
	do
		echo >/dev/tcp/${HOST}/${PORT} &> /dev/null && echo 'knocked $PORT'
	done
}

echo "Opening port"
open_home_port
echo "Start SSH"
ssh -p${HIDDEN_PORT} ${USER}@{HOST}
if [ $? -eq 0 ] 
then
	
	echo "Done with SSH...closing port"
	close_home_port
fi
echo "Done"
