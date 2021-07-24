#Set execution policy to allow script to run
Set-ExecutionPolicy Bypass -Scope Process -Force

#Set TLS version to 1.2+
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Install chocolatey package manager
Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#install required packages
choco install -y "python;git;vagrant;ruby;virtualbox"

#clone the repository
git clone https://github.com/BrynardSecurity/Sophos-ISE-Project 

Set-Location .\Sophos-ISE-Project\sophos_range_local

#create python virtual environment
python -m venv venv
venv\Scripts\activate

#install requirements
python -m pip install -r requirements.txt
ansible-galaxy collection install community.windows