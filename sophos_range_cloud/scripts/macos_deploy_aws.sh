#!/bin/bash
brew update
brew install python awscli git terraform
pip3 install virtualenv
git clone https://github.com/BrynardSecurity/Sophos-ISE-Project && cd Sophos-ISE-Project/sophos_range_cloud
cd terraform/aws/local
terraform init
cd ../../..
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
