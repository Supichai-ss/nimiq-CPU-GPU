#!/bin/bash
DN_URL="https://siriuspool.net/release/"
DN_URL_GIT="https://github.com/Kos-M/SiriusMiner/releases/download/v"
PIDFILE="/tmp/-siriusminer--upgrade-service.pid"
SCRIPT_PATH=$(dirname "$0")
UPDATE_MEMO="./.update_mem.json"
CHECK_INTERVAL=$(  expr 60 \*  $(( 5 + RANDOM % 12 ))) # random  5 - 16  * 60
 
PURPLE='\033[0;35m'
YELLOW="\033[1;33m"
NC='\033[0m'
if [ -s "$PIDFILE" ] ;then
     exit
fi
echo $BASHPID > $PIDFILE

function safe_Exit(){
	if [ -f "$PIDFILE" ] ; then 
	rm $PIDFILE
	fi
	exit
}
trap " safe_Exit " SIGKILL
trap "safe_Exit" SIGINT
trap "safe_Exit" ERR

while true ; do
if [ -f "$UPDATE_MEMO" ] ; then 
	echo -e "${YELLOW}Receiving Update.. (please dont close miner)${NC}"
	process_pid=$(grep -Po '"'"process_pid"'"\s*:\s*"\K([^"]*)' $UPDATE_MEMO )
	install_location=$(grep -Po '"'"install_location"'"\s*:\s*"\K([^"]*)' $UPDATE_MEMO)
	new_version=$(grep -Po '"'"new_version"'"\s*:\s*"\K([^"]*)' $UPDATE_MEMO)
	platform=$(grep -Po '"'"platform"'"\s*:\s*"\K([^"]*)' $UPDATE_MEMO )
	arch=$(grep -Po '"'"arch"'"\s*:\s*"\K([^"]*)' $UPDATE_MEMO )
	flavor=$(grep -Po '"'"flavor"'"\s*:\s*"\K([^"]*)' $UPDATE_MEMO )
	if [ "$install_location" == "~/" ] ; then 
		install_location="$HOME"
	fi 	
	echo -e  "${YELLOW}Installing $new_version : siriusminer-$platform-$arch-$flavor to selected location : $install_location ${NC}"
	wget --show-progress  -q  "$DN_URL_GIT$new_version/siriusminer-$platform-$arch-$new_version-$flavor.tar.gz"
	if [ -f "siriusminer-$platform-$arch-$new_version-$flavor.tar.gz" ] ; then 
	tar zxf siriusminer-$platform-$arch-$new_version-$flavor.tar.gz
	rm siriusminer-$platform-$arch-$new_version-$flavor.tar.gz
	if [ -d "$install_location/siriusminer-$platform-$arch-$new_version-$flavor" ] ; then # check if folder with this version already exists in default install location
		echo -e  "${PURPLE} Folder $install_location/siriusminer-$platform-$arch-$new_version-$flavor Already Exists${NC}"
		echo -e  "${PURPLE}  Auto Upgrade Aborted !${NC}"
		if [ -f "$UPDATE_MEMO" ] ; then 
			rm $UPDATE_MEMO
		fi 
		safe_Exit # if dont exit here will loop forever if folder exists.safe exit!
	else
		kill $process_pid 2> /dev/null
		echo ">copying sirius.conf to $install_location/siriusminer-$platform-$arch-$new_version-$flavor"
		cp sirius.conf siriusminer-$platform-$arch-$new_version-$flavor
		echo ">moving main-light-consensus to $install_location/siriusminer-$platform-$arch-$new_version-$flavor"
		mv main-light-consensus  siriusminer-$platform-$arch-$new_version-$flavor
		mv siriusminer-$platform-$arch-$new_version-$flavor    $install_location
	 	safe_Exit
	fi
	fi
fi
sleep $CHECK_INTERVAL
done
	if [ -f "$PIDFILE" ] ; then 
	rm $PIDFILE
	fi
