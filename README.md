# PhoneHome

## Description
This simple bash script helps to execute port knocking, SSH to the hidden port, and then closes the SSH port once the SSH session exits

## Configuration

The ph.conf file needs to be updated with the following information:

**USER** : the SSH username that will be be part of the SSH connection string

**HOST** : the IP or hostname of the host we are connecting to and doing the port knocking on

**OPEN_PORTS** : the port knocking sequence that opens the hidden port
All the ports need to be written here and separated by a space. ie "7000 8000 9000"

**HIDDEN_PORT** : the hidden SSH port we will be connecting to

**CLOSE_PORTS** : the port knocking sequence that closes the hidden port
