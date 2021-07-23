#!/bin/bash
sudo apt-get update
sudo apt-get install -y python3-dev git unzip python3-pip awscli curl
sudo pip3 install virtualenv
curl -s https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_linux_amd64.zip -o terraform.zip
unzip terraform.zip
sudo mv terraform /usr/local/bin/
git clone https://github.com/BrynardSecurity/Sophos-ISE-Project && cd Sophos-ISE-Project/sophos_range_cloud
cd terraform/aws/local
terraform init
cd ../../..
cd terraform/azure/local
terraform init
cd ../../..
virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt
