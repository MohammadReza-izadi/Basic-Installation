#!/bin/bash
LRED="\033[1;31m" # Light Red 
LGREEN="\033[1;32m" # Light Green
NC='\033[0m' # No Color
echo $EUDE
if (( EUID == 0 )); then
	echo "You must NOT be root to run this." 1>&2

	exit 1
fi

# prevent root from creating ~/tmp/ by creating it ourself and cause permission problems
# Make .node because in the later versions of npm, it's too stupid to make a folder anymore
mkdir ~/tmp/ ~/.node/
####################################   Docker
echo ""
echo "Would you like to install docker ? (Y/n) "
read docker
if [ -z "$docker" ]; then
	docker="Y"
fi

####################################  sublimetext
echo ""
echo "Would you like to install sublimetext? (Y/n) "
read sublimetext
if [ -z "$sublimetext" ]; then
	sublimetext="Y"
fi

if [ "$sublimetext" == "Y" ]; then
    sudo wget -O- https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/sublimehq.gpg
    echo 'deb [signed-by=/usr/share/keyrings/sublimehq.gpg] https://download.sublimetext.com/ apt/stable/' | sudo tee /etc/apt/sources.list.d/sublime-text.list
fi
####################################  ZSH
echo ""
echo "Would you like to install oh-my-zsh ? (Y/n) "
read zsh
if [ -z "$zsh" ]; then
	zsh="Y"
fi
####################################  chromium-browser
echo ""
echo "Would you like to install chromium-browser ? (Y/n) "
read chromium_browser
if [ -z "$chromium_browser" ]; then
	chromium_browser="Y"
fi

####################################  vim
echo ""
echo "Would you like to install vim ? (Y/n) "
read vim
if [ -z "$vim" ]; then
	vim="Y"
fi


####################################  vlc
echo ""
echo "Would you like to install vlc ? (Y/n) "
read vlc
if [ -z "$vlc" ]; then
	vlc="Y"
fi

####################################  tmux
echo ""
echo "Would you like to install tmux ? (Y/n) "
read tmux
if [ -z "$tmux" ]; then
	tmux="Y"
fi

####################################  curl
echo ""
echo "Would you like to install curl ? (Y/n) "
read curl
if [ -z "$curl" ]; then
	curl="Y"
fi

####################################  traceroute
echo ""
echo "Would you like to install vlc ? (Y/n) "
read traceroute
if [ -z "$traceroute" ]; then
	traceroute="Y"
fi


####################################  git
# echo ""
# echo "Would you like to install git ? (Y/n) "
# read git
# if [ -z "$git" ] || [ "$git" == "Y" ] ; then
#     echo ""
#     echo "Please enter your name (for git): "
#     read git_name

#     echo ""
#     echo "Please enter your email (for git): "
#     read git_email

# 	Git="Y"
# fi

####################################  openvpn
echo ""
echo "Would you like to install openvpn ? (Y/n) "
read openvpn
if [ -z "$openvpn" ]; then
	openvpn="Y"
fi

####################################  Mattermost
echo ""
echo "Would you like to install Mattermost ? (Y/n) "
read Mattermost
if [ -z "$Mattermost" ]; then
	Mattermost="Y"
fi

####################################  slack
echo ""
echo "Would you like to install slack ? (Y/n) "
read slack
if [ -z "$slack" ]; then
	slack="Y"
fi

####################################  telegram_desktop
echo ""
echo "Would you like to install telegram_desktop ? (Y/n) "
read telegram_desktop
if [ -z "$telegram_desktop" ]; then
	telegram_desktop="Y"
fi

####################################  keepass
echo ""
echo "Would you like to install keepass ? (Y/n) "
read keepass
if [ -z "$keepass" ]; then
	keepass="Y"
fi

####################################  pip
echo ""
echo "Would you like to install pip ? (Y/n) "
read pip
if [ -z "$pip" ]; then
	pip="Y"
fi

####################################  ranger
echo ""
echo "Would you like to install ranger ? (Y/n) "
read ranger
if [ -z "$ranger" ]; then
	ranger="Y"
fi



echo -e "\n\n${LGREEN}################################################################################"
echo -e "${LGREEN}########################### Start Installation ##################################"
echo -e "${LGREEN}#################################################################################"

sudo apt update
sudo apt install bash-completion -y
echo -e "${LGREEN}########################### zsh ##################################${NC}"
if [ "$zsh" == "Y" ];then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	# default shell
	sudo chsh -s /usr/bin/zsh

    # sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    # sudo apt install zsh -y
    # chsh -s $(which zsh)

fi
echo -e "${LGREEN}########################### chromium_browser ##################################${NC}"
if [ "$chromium_browser" == "Y" ];then
    sudo apt install chromium-browser -y
fi
echo -e "${LGREEN}########################### vim ##################################${NC}"

if [ "$vim" == "Y" ];then
    sudo apt install vim -y
fi
echo -e "${LGREEN}########################### vlc ##################################${NC}"

if [ "$vlc" == "Y" ];then
    sudo apt install vlc -y
fi
echo -e "${LGREEN}########################### tmux ##################################${NC}"

if [ "$tmux" == "Y" ];then
    sudo apt install tmux -y
fi
echo -e "${LGREEN}########################### curl ##################################${NC}"
if [ "$curl" == "Y" ];then
    sudo apt install curl -y
fi
echo -e "${LGREEN}########################### traceroute ##################################${NC}"
if [ "$traceroute" == "Y" ];then
    sudo apt install traceroute -y
fi
echo -e "${LGREEN}########################### Git ##################################${NC}"
if [ "$Git" == "Y" ];then
    sudo apt install git -y
    # MohammadReza-izadi
    # mohammadreza.i1997@gmail.com
    sudo git config --global user.name "$git_name"
    sudo git config --global user.email "$git_email"
fi

# if [ "$openvpn" == "Y"];then
#     # https://www.cyberciti.biz/faq/howto-setup-openvpn-server-on-ubuntu-linux-14-04-or-16-04-lts/
#     wget https://git.io/vpn -O openvpn-install.sh
#     chmod +x openvpn-install.sh
#     bash openvpn-install.sh
# fi

echo -e "${LGREEN}########################### Mattermost ##################################${NC}"
if [ "$Mattermost" == "Y" ];then
    curl -o- https://deb.packages.mattermost.com/setup-repo.sh | sudo bash
    sudo apt install mattermost-desktop -y
    sudo apt upgrade mattermost-desktop
fi
echo -e "${LGREEN}########################### slack ##################################${NC}"
if [ "$slack" == "Y" ];then
    sudo apt install slack -y
fi
echo -e "${LGREEN}########################### Telegram Desktop ##################################${NC}"
if [ "$telegram_desktop" == "Y" ];then
    sudo snap install telegram-desktop -y
fi
echo -e "${LGREEN}########################### KeePass ##################################${NC}"
if [ "$keepass" == "Y" ];then
    # sudo apt-add-repository ppa:jtaylor/keepass
    # sudo apt-get update && sudo apt-get upgrade
    sudo apt-get install keepass2 -y
fi
echo -e "${LGREEN}########################### pip ##################################${NC}"
if [ "$pip" == "Y" ];then
    sudo apt-get install pip -y
    sudo apt-get install pip3 -y

fi

echo -e "${LGREEN}########################### ranger ##################################${NC}"

# if [ "$ranger" == "Y" ];then
#     sudo pip install ranger-fm
# fi


echo -e "${LGREEN}########################### Docker ##################################${NC}"

if [ "$docker" == "Y" ]; then
	# sudo apt-get install -y apt-transport-https
	# # Add Official Docker Repository to install docker as opposed to using official Ubuntu package
	# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
	# sudo sh -c "echo deb https://get.docker.com/ubuntu docker main\
	# > /etc/apt/sources.list.d/docker.list"
	# sudo apt-get update
	# sudo apt-get install -y lxc-docker
	# # Configure Docker to be used without sudo
	# sudo groupadd docker
	# sudo gpasswd -a $USER docker
	# sudo service docker restart

	sudo apt-get update
	sudo apt-get install \
	   ca-certificates \
	   curl \
	   gnupg \
	   lsb-release
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo chmod a+r /etc/apt/keyrings/docker.gpg
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
fi

# echo $docker
# if [ "$docker" == "Y" ];then
#     curl -Sslf https://get.docker.com/ | sudo bash
# fi
echo -e "${LGREEN}########################### sublimetext ##################################${NC}"

if [ "$sublimetext" == "Y" ]; then
    sudo apt install sublime-text -y
fi





############################### End
if [ "$docker" == "Y" ]; then
	echo "Script Complete. Please log out and log back in to finish Docker configuration."
fi

