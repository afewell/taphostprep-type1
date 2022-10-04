#!/bin/bash

## Copy, uncomment and enter the following commands to execute this script 
### wget -O /tmp/devhost.sh https://raw.githubusercontent.com/afewell/scripts/main/os/ubuntu/installscripts/compound/devhost.sh
### sudo chmod +x /tmp/devhost.sh 
### sudo /tmp/devhost.sh


## Note: if any manual steps will be required after any install script, you can append instructions to >> /tmp/postactions.txt from the install script, and these will be displayed to the user at the end of this script  

## Global variables
### note that scripts executed by this script cannot gather user inputs
read -p "Enter your exact username for this host - default value is viadmin: " user
user=${user:-viadmin}
echo "user value is: ${user}"


read -p "Install curl? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    apt-get update
    apt install curl -y
fi

read -p "Install vim? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    apt-get update
    apt install vim -y
fi

read -p "Install git? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    apt-get update
    apt install git -y
fi

read -p "Clone the afewell/scripts repo? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    cd /home/$user
    git clone https://github.com/afewell/scripts.git
fi

## Install Docker
read -p "Install Docker CE? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    installscriptname="dockerce.sh"
    wget https://raw.githubusercontent.com/afewell/scripts/main/os/ubuntu/installscripts/${installscriptname} -O /tmp/${installscriptname}
    chmod +x /tmp/${installscriptname}
    source /tmp/${installscriptname}
    rm /tmp/${installscriptname}
fi

read -p "Install VS Code? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    installscriptname="vscode.sh"
    wget https://raw.githubusercontent.com/afewell/scripts/main/os/ubuntu/installscripts/${installscriptname} -O /tmp/${installscriptname}
    chmod +x /tmp/${installscriptname}
    source /tmp/${installscriptname}
    rm /tmp/${installscriptname}
fi

read -p "Install JQ? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    apt-get update
    apt install jq -y
fi

read -p "Install minikube? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    installscriptname="minikube.sh"
    wget https://raw.githubusercontent.com/afewell/scripts/main/os/ubuntu/installscripts/${installscriptname} -O /tmp/${installscriptname}
    chmod +x /tmp/${installscriptname}
    source /tmp/${installscriptname}
    rm /tmp/${installscriptname}
fi

read -p "Install kubectl 1.23.10? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    installscriptname="kubectl_1-23-10.sh"
    wget https://raw.githubusercontent.com/afewell/scripts/main/os/ubuntu/installscripts/${installscriptname} -O /tmp/${installscriptname}
    chmod +x /tmp/${installscriptname}
    source /tmp/${installscriptname}
    rm /tmp/${installscriptname}
fi

read -p "Install helm? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    installscriptname="helm.sh"
    wget https://raw.githubusercontent.com/afewell/scripts/main/os/ubuntu/installscripts/${installscriptname} -O /tmp/${installscriptname}
    chmod +x /tmp/${installscriptname}
    source /tmp/${installscriptname}
    rm /tmp/${installscriptname}
fi

read -p "Install dnsmasq? (y/n):" install
if [ "$install" = "y" ] || [ "$install" = "Y" ]
then
    installscriptname="dnsmasq.sh"
    wget https://raw.githubusercontent.com/afewell/scripts/main/os/ubuntu/installscripts/${installscriptname} -O /tmp/${installscriptname}
    chmod +x /tmp/${installscriptname}
    source /tmp/${installscriptname}
    rm /tmp/${installscriptname}
fi



## The below command should be the last thing that executes

if [ -f /tmp/postactions.txt ]
then
    cat /tmp/postactions.txt
    rm /tmp/postactions.txt
fi
