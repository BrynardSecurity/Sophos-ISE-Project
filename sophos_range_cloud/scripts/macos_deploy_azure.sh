#!/bin/bash
brew update
brew install python azure-cli git terraform
pip3 install virtualenv
git clone https://github.com/BrynardSecurity/Sophos-ISE-Project && cd Sophos-ISE-Project/sophos_range_cloud
cd terraform/azure/local
terraform init
cd ../../..
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
