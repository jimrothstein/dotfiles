
#!/bin/zsh
#	file <- "/home/jim/.local/bin/cron_daily_docs_BACKUP.sh#"
# #######
# PURPOSE:  
# Using tar, create a backup ~/code/docs/ 
#	Many of these files should NOT go to github.
#	For now, backup to ~/Downloads/to_Drive/

#
#
#	SEE ALSO file <- "/home/jim/code/zsh_project/ZSH_SH_FILES/900_tar_backup.sh	"
########

####	the date and the_file_name
##	create variable
	export theDate=$(date +%d%b%Y)
	echo ${theDate}

	export the_file_name=${theDate}_cron_daily_docs_BACKUP.tar.gz
	echo ${the_file_name}
	
	export the_destination_dir=~/Downloads/to_Drive
	echo ${the_destination_dir}



####	Use tar
#		-c 		create
#		-v		verbose
#		-f		use specified file name	
#
##	tar [options] <backup_to.tar.gz> -X <exclude> <files>

##	just some practice

#	tar -cvzf test.tar.gz *

cd ~/code/docs/ALZ
tar -cvzf ${the_destination_dir}/${the_file_name} *

cd ~

exit

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
{
	tar --list -f ${theDate}_test.tar.gz
	tar --list -f ${the_file_name}

##	Remove it
{
 	rm test.tar.gz	
}	



##-------------
##		LEGACY
##-------------

theDate
1:
	@echo $(theDate)
	@echo $(.SHELLSTATUS)


2:	1
	@echo $(theDate)

date:
		@echo $(shell whoami)			# jim
		@echo $(shell arch)				# x86_64
		@echo $(theDate)				# WED Sept 26 ....
		@echo $(shell date +%Y%m%d)     # 20200301
		@echo $(shell date +"%^a %d%b%Y") # WED Sept 26 


test:
	# works
	tar -cvzf test.tar.gz *

test_mess:
	tar -cvzf test_'$(theDate)'_.tar.gz *

backup: 
	@#	Something still wrong with date.... extra ???
	@#	tar [options] <backup_to.tar.gz> -X <exclude> <files>

	@echo $(theDate)
	@tar -cvpzf ~/Downloads/toGoogle/legal_backup_"$(theDate)".tar.gz -X exclude_files.txt *
	@echo $(theDate)

backup_list:
	@tar -tf ~/Downloads/toGoogle/legal_backup_"$(theDate)".tar.gz
	@echo $(theDate)


find:
	find ~ -name "*.tar.gz"




