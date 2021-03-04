#/bin/bash

##################
# PhoneHome 0.1
#
# By Ivan (Nick) Delgado
##################

if [ ! -f ph.conf ]; then
	echo "Configuration file 'ph.conf' not found"
	exit 1
else
	. ph.conf
fi

open_home_port() {
	for PORT in ${OPEN_PORTS[@]}
	do
		echo >/dev/tcp/${HOST}/${PORT} &> /dev/null && echo 'knocked $PORT'
	done
}

function close_home_port() {
	for PORT in ${CLOSE_PORTS[@]}
	do
		echo >/dev/tcp/${HOST}/${PORT} &> /dev/null && echo 'knocked $PORT'
	done
}

echo "Opening port"
open_home_port
echo "Start SSH"
ssh -p${HIDDEN_PORT} ${USER}@${HOST}
if [ $? -eq 0 ] 
then
	
	echo "Done with SSH...closing port"
	close_home_port
fi
echo "Done"
