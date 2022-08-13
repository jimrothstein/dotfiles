#!/bin/zsh

#		PURPOSE:		adb push * /sdcard/Music
#								push files to device AND keep log (should push fail)
#	TODO
#
#
#	USAGE:
#				If adb error:   CHECK:
#				less ~/adb_push_mp3_device_LOG.log   and then search `error`
#
#				
#
#	from directory with mp3 files (`~/mp3_files`)

cd ~/mp3_files
adb push * /sdcard/Music | tee > ~/adb_push_mp3_device_LOG.log

exit






#---------
#		LEGACY
#---------
#	returns true or false
has_arg() {
	test -n "$1"
}

#	

add_commit_push()
{


	if has_arg "$1"
	then
	else  echo "** problem ** "
				echo "USAGE: must have arg <dir>"
				exit
	fi

	cd $1

	#		Add files, Commit, Push
	line="==========================="
	echo "\n"
	echo $line
	echo $(date) 
	echo ".... BEGIN ... ${1} ... ${PWD}" 

	#echo "\n"
	echo "....STATUS ..."
	git s

	
	#echo "\n"
	echo "....ADD FILES ..." 
	git a

	#echo "\n"
	echo "....COMMIT ..." 
	git cm wip
	
	#echo "\n"
	echo "....PUSH ..." 
	git push
	
	#echo "\n"
	echo "....FINAL STATUS ..."
	git s
	echo $line
}

# run function, using directory specified as arg 1
add_commit_push  $1 
