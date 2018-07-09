whoami
exit
whoami
exit
ll
exit
ll
exit
xiwi -T R
sudo apt-get install r-studio
gpg --keyserver keys.gnupg.net --recv-keys 3F32EE77E331692F
man gpg
cd Downloads/
ll
dpkg -i rstudio-xenial-1.1.453-amd64.deb 
sudo dpkg -i rstudio-xenial-1.1.453-amd64.deb 
cd ..
whereis rstudio
xiwi -T rstudio
exit
uname -a
ll
mkdir dotfiles
ll
ls .bash*
mv .bash* dotfiles/
ll
ln -s dotfiles/.bashrc .bashrc
ll
more .bashrc 
ll
ln -s dotfiles/.bash_history .bash_history
ln -s dotfiles/.bash_logout .bash_logout
ll
cd .config
ll
cd pulse
ll
cd ..
echo $PATH 
set
sudo apt-get update
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9
sudo apt-get update
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9
sudo apt-get update
sudo apt-get install r-base r-base-dev
sudo apt-get install -f r-base r-base-dev
sudo apt-get install -f 
sudo apt-get install  r-base r-base-dev
tmux
exit
xiwi -T rstudio
exit
xiwi -T rstudio
exit
cd Downloads/
ll
deb -i rstudio-xenial-1.1.453-amd64.deb 
dpkg -i rstudio-xenial-1.1.453-amd64.deb 
sudo dpkg -i rstudio-xenial-1.1.453-amd64.deb 
cd /etc/apt
ll
more sources.list
sudo nvim sources.list
sudo ~/bin/nvim sources.list
sudo apt update
man apt-secure
apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
cd ~
nvim
sudo apt-key add key.txt
nvim
xiwi -T rstudio
sudo edit-chroot -a
exit
cd dotfiles
ll
cp .bash_logout .bash_env
nvim .bash_env
cd ..
cd lib
mkdir lib
mkdir lib/R_USER_LIB
ll
cd R
ll
cd ..
ll
cd lib/
ll
rm -dr R_USER_LIB/
cd ..R
cd ..
cd R
ll
mkdir R_USER_LIB
cd ..
ll
ln -s ~/dotfiles/.bash_env
ll
nvim .bash_
nvim .bash_env 
ll
exit
source .bash_env
echo $R_LIBS_USER 
cd $R_LIBS_USER 
cd R
ll
rm -rf R_USER_LIB
mkdir R_LIBS_USER
source ~/.bash_env 
echo $R_LIBS_USER 
exit
tmux
exit
nvim tmux.sh
ll
chmod u+x tmux.sh 
ll
mv tmux.sh 
mv tmux.sh bin/
ll
more tmux.sh
ll
cd bin
ll
more tmux.sh 
tmux kill-server
ll
nvim tmux.sh 
tmux.sh 
tmux kill-session
nvim tmux.sh 
ll
cd ..
ll
cd R/
l
ll
cd R_LIBS_USER/
ll
cd ..
cd dotfiles
ll
fg
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
cd ..
cd .config/
ll
mkdir nvim
cd nvim
ln -s ~/dotfiles/init.vim init.vim
ll
echo $VIMRC
fg
cd ~
l
ll
nvim .bash_env 
source .bash_env 
nvim .bash_env
source .bash_env 
nvim .bash_env 
source .bash_env 
nvim $VIMRC 
echo $VIMRC
cd ~/.config/nvim/init.vim 
cd ~/.config/nvim
ll
e init.vim 
nvim init.vim 
echo $VIMRC 
ll ~/dotfiles
more $VIMRC 
more .bashrc
more ~./bashrc
cd ~/dotfiles
ll
nvim init.vim 
ll ~/.config/nvim/init.vim 
less  ~/.config/nvim/init.vim 
more  ~/.config/nvim/init.vim 
ll $VIMRC 
cd ~/.config/nvim/
ll
ll init.vim
more /home/jim/dotfiles/init.vim 
more init.vim
more ~/.config/nvim/init.vim 
cd ~
more ~/.config/nvim/init.vim 
more dotfiles/init.vim 
echo $VIMRC 
ll $VIMRC 
ll "$VIMRC"
cd bin
ll
nvim tmux.sh 
cd ..
ll
cd code/
ll
mkdir sr_/
cd sr_/
nvim bash_test.sh
echo $PATH
/home/jim/bin:/home/jim/.local/bin:/home/jim/bin:/home/jim/.local/bin:/home/jim/bin:/home/jim/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
fg
source ~/.bash_env 
echo $PATH
echo $OLD_PATH
echo $START_TMUX 
cd ~/dotfiles
ll
mv tmux.sh start_tmux.sh
fg
cd ..
nvim $START_TMUX 
exit
tmux.sh 
tmux list-sessions
tmux list-windows
tmux new-window win_nvim
tmux new-window win_nvim -t jimSession
tmux list-sessions
tmux list-windows
tmux new-window -n win_nvim -t jimSession
sudo apt install git
cd ..
ll
cd .config/
ll
cd ..
git status
more .lesshst 
more .profile
if [ -n "$BASH_VERSION" ]; echo "true"; ;
if [ -n "$BASH_VERSION" ]; then echo "true"; ;
if [ -n "$BASH_VERSION" ]; then echo "true" fi; ;
if [ -n "$BASH_VERSION" ]; then echo "true";
if [ -n "$BASH_VERSION" ]; then echo "true"; fi
ll
cd bin
ll
mv tmux.sh ../dotfiles/
cd ../dot
cd ../dotfiles/
cd ..
tmux kill-server
nvim $START_TMUX 
exit
tmux list-sessions
tmux list-clients
exit
exit
tmux list-sessions
tmux list-windows
~/dotfiles/start_tmux.sh 
eit
exit
start_tmux.sh 
tmux list-sessions
cd ~/bin
ll
ln -s ~/dotfiles/start_tmux.sh start_tmux.sh
ll
tmux kill-server
more $START_TMUX 
more "$START_TMUX" 
more "$(START_TMUX)"
cd dotfiles
ll
git status
cd ..
ssh-keygen -t rsa -b 4096 -C "jimrothstein@gmail.com"
ll .config/
mkdir .config/.ssh
ssh-keygen -t rsa -b 4096 -C "jimrothstein@gmail.com"
cd .ssh
ll
mv * ~/.config/.ssh/
ll
cd ..
rm -rd .ssh
cd dotfiles/
more id_rsa.pub
cd ~/.config/.ssh
ll
more id_rsa.pub 
cd ~/dotfiles/
git@github.com:jimrothstein/dotfiles.git
man git-clone
git clone git@github.com:jimrothstein/dotfiles.git
ssh -T git@github.com
cd ~
ssh -vT git@github.com
ll
cd .ssh
ll
mv ~/.config/.ssh/*
ll
mv ~/.config/.ssh/id_rsa.pub 
mv ~/.config/.ssh/id_rsa.pub .
ll
ll ~/.config/.ssh/
ll
ssh -T git@github.com
ll
rm *
ll
rm -rd ~/.config/.ssh/
ssh-keygen -t rsa -b 4096 -C "jimrothstein@gmail.com"
ll
more id_rsa.pub
ssh -T git@github.com
git clone git@github.com:jimrothstein/dotfiles.git
ll
rm -rf dotfiles/
cd ..
cd dotfiles
ll
git clone git@github.com:jimrothstein/dotfiles.git
git status
ll
cd dotfiles
ll
mv * ../
ll
ll ../
ll
mv -R .git/* ../
man mv
mv .git/ ../
ll
cd ..
ll
rm -rf dotfiles/
git status
git add .
git commit -m "7July - 1st commit"
git config --global user.email "jimrothstein@gmail.com"
git config --global user.name "jimrothstein"
git commit -m "7July - 1st commit"
git push
echo $VIMRC 
more $VIMRC 
fg
nvim $VIMRC 
VIMRC=~/dotfiles/init.vim 
nvim $VIMRC 
source ~/dotfiles/.bash_env
echo $VIMRC 
fg
source .bash_aliases 
goCode
$goCode 
cd ..
ll
$goDot 
goDot
ll
goCode
cd code
ll
cd sr_/
ll
more bash_test.sh 
chmod u+x bash_test.sh 
./bash_test.sh 
[[ -n $BASH_VERSION ]]
echo [[ -n $BASH_VERSION ]]
echo "$BASH_VERSION"
nvim bash_test.sh 
./bash_test.sh 
fg
./bash_test.sh 
fg
./bash_test.sh 
fg
./bash_test.sh 
fg
./bash_test.sh 
fg
./bash_test.sh 
fg
./bash_test.sh 
fg
./bash_test.sh 
fg
./bash_test.sh 
fg
./bash_test.sh 
fg
start_tmux.sh 
ll
ln -s ~/dotfiles/bash_aliases .bash_aliases
ll
touch ~/dotfiles/.bash_aliases
ll
sudo apt-get musescore
sudo apt-get install musescore
musescore
nvim ~/dotfiles/start_tmux.sh 
man tmux
tmux kill-server
tmux list-sessions
tmux list-windows
tmux list-clients
cd dotfiles/
ll
nvim start_tmux.sh 
echo $TMUX
test -z $TMUX
test -z $TMUX; then echo "he" fi
test -z $TMUX then echo "he" fi
man test
test -z $TMUX
test -z $TMUX1
test -z $TMUX3
echo (test -z $TMUX)
echo "test -z $TMUX"
echo "test -z $TMUX1"
test "-z $TMUX"
tmux kill-server
env
goDot
cd ~/dotfiles/
exit
nvim
fg
cd code/sr_/
ll
./bash_test.sh 
fg
ll
chmod +x test_tmux.sh 
ll
chmod -x test_tmux.sh 
ll
chmod u+x test_tmux.sh 
ll
./test_tmux.sh 
fg
ll
./test_tmux.sh 
fg
./test_tmux.sh 
fg
./test_tmux.sh 
fg
./test_tmux.sh 
fg
nvim test_tmux.sh 
./test_tmux.sh 
fg
./test_tmux.sh 
fg
./test_tmux.sh 
fg
source ~/dotfiles/.bashrc
env
source ~/dotfiles/.bash_aliases 
env | grep go*
fg
cd ~/dotfiles
ll
nvim .bash_env 
. .bashrc 
nvim ~/code/BASH_usingShell/make_play/make_device/device_info.mk 
ll
cp code/sr_/test_tmux.sh ../jim/Downloads/
goCode
env
env | grep go*
source ~/.bash_aliases 
source ~/dotfiles/.bash_aliases 
env | grep go*
source .bash_aliases 
env | grep go*
alias
alias goCode='go ~\code\'
goCode 
alias goCode='go ~\code'
goCode 
alias goCode='cd ~\code'
goCode 
alias goCode='cd ~/code'
goCode 
cd ~
ll
cd dotfiles/
ll
more .bash_aliases 
. .bash_env
. .bash_aliases 
. .bashrc
more .bashrc
cd ~/code
ll
git clone git@github.com:jimrothstein/BASH_usingShell.git
ll
cd BASH_usingShell/
ll
cd nvim_play/
ll
more makefile
cd ..
cd make_play/
ll
cd make_device/
ll
export MAKE_DEVICE=/home/jim/code/BASH_usingShell/make_play/make_device/device_info.mk 
echo $MAKE_DEVICE 
man uname
ll
make device_info.mk 
more device_info.mk 
make version
ll
make device_info.mk version
make -f device_info.mk version
sudo fdisk -l
man sudo
uname -r
mount
make -f device_info.mk mount
make -f device_info.mk fstab
cat /etc/mtab
cat /etc/mtab | grep mmc
make -f device_info.mk du
lspci
sudo modprobe
tune2fs
readelf
man readelf
man modprobe
make -f device_info.mk modprobe
more device_info.mk 
make -f device_info.mk modprobe
sudo modprobe -a
sudo modprobe -h
q
man modprobe
sudo modprobe -C
sudo modprobe -d
sudo modprobe -V
echo $PS1
make -f device_info.mk PS1
cp device_info.mk ~/Downloads/
cd ~
more /etc/sudoers
sudo more /etc/sudoers
whoami
sudo visudo
sudo kill-server
tmux kill-server
xiwi -T rstudio
ll
cd Downloads/
ll
sudo dpkg -i rstudio-xenial-1.1.453-amd64.deb 
sudo apt-get update
sudo enter-chroot
xiwi -T rstudio
locate libxslt.so.1
ldd rstudio | grep xslt
cd ..
sudo find / -name "*xslt*"
sudo find / -name libxslt.so.1
sudo find / -name libxslt*
sudo apt-get install libxslt1-dev
xiwi -T rstudio
sudo enter-chroot
tmux new-session -s jimSession -d
tmux new-window win_tmux
tmux new-window win_nvim
tmux new-window win_rstudio
tmux attach-session -t jimSession
ll
echo "$PATH"
cd bin
./tmux.sh 
man bash
echo $SHELL
nvim tmux.sh 
./tmux.sh 
ll
tmux list-sessions
more tmux.sh 
tmux new-session jimSession
tmux list-sessions
tmux kill-session
tmux
nvim tmux.sh
tmux kill-session
tmux
cd ..
echo $PATH
source .bash_env 
echo $PATH
more .bash_env
$START_TMUX 
~/dotfiles/start_tmux.sh 
tmux kill-server
tmux
start_tmux.sh 
clear
start_tmux.sh
sudo reboot now
exit
ls
ll
cd
ll
exit
ls
ll
