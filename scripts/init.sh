!/bin/bash

 THIS SCRIPT IS DESIGNED TO AUTOMATE REPO TO YOUR DIRECTORY AND INSTALL ALL DEPENDENCY TO ENSURE ALL SOFTWARE RUN SMOOTHLY

read -p 'please enter your github username :' gituser

read -p 'please enter your project name :' project

read -p 'enter directory you want to clone :' crazy_url

REPO_URL="https://github.com/$gituser/$project.git"
home_url="$crazy_url"
final_url="/$project/$home_url"


 INSTALLING DEPENDENCIES
sudo yum install vim wget curl

docker --version > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "You already have Docker installed."
else
  echo "Docker is not installed. Installing now..."

  sudo yum install -y yum-utils

  sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

  sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

  echo "Docker installation complete."
fi

rpm -qa | grep ansible

if [ $? -eq 0 ]; then

echo "Ansible already installed"

ansible -m ping webservers

else

echo "installing ansible for you dear..."

sudo yum install epel-release -y
sudo yum install ansible -y

fi




INSTALLING GIT

 if [ ! command -v git &> /dev/null ]

    then echo "GIT is not installed, installing for you"

    else

    sudo yum install git -y

     echo "installed succesfully"

 fi




git clone "$REPO_URL" "$final_url"

cd /$project/docker

cp -r /$project/$home_url/* .

echo /$project/$home_url

export project_name="$project"
export finaler_url="$final_url"

echo "export project_name=\"$project\"" >> /root/.bashrc
echo "export finaler_url=\"$final_url\"" >> /root/.bashrc

cd /root

source .bashrc

cd /$project/docker

docker compose -f nodeservice.yml up --build

