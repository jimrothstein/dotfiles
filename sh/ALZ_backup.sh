#	file <- "/home/jim/code/zsh_project/ZSH_SH_FILES/900_tar_backup.sh#"
#
# #######
# PURPOSE:  
# Using tar, create a backup of specific important files that should
# NOT go to github.   Instead, this backup should go to DRIVE.
#
#
#	SEE ALSO file <- "/home/jim/code/zsh_project/ZSH_SH_FILES/900_tar_backup.sh	"
########

####	the date and the_file_name
{
date +%d%b%Y

##	create variable
	export theDate=$(date +%d%b%Y)
	echo ${theDate}

	export the_file_name=${theDate}_test.tar.gz
	echo ${the_file_name}

}

####	Use tar
#		-c 		create
#		-v		verbose
#		-f		use specified file name	
#
##	tar [options] <backup_to.tar.gz> -X <exclude> <files>

##	just some practice
#tar -cvzf test.tar.gz *

#tar -cvzf ${theDate}_test.tar.gz *


##	Go to directory for Backup.
{
	cd ~/code/docs/ALZ
	ls -la
}
##	for real backup
{
tar -cvzf ${the_file_name} *
ls -la 

mv ${the_file_name}  ~/Downloads/to_Drive
ls -lha ~/Downloads/to_Drive
}

##	list contents
#	tar --list -f ${theDate}_test.tar.gz
#	tar --list -f ${the_file_name}
##	Remove it
# 	rm test.tar.gz	







