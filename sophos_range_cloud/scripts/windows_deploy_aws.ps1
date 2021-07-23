#Set execution policy to allow script to run
Set-ExecutionPolicy Bypass -Scope Process -Force

#Set TLS version to 1.2+
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Install chocolatey package manager
Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install the required packages
choco install "python;awscli;git;terraform"

#clone the repository
git clone https://github.com/BrynardSecurity/Sophos-ISE-Project && cd Sophos-ISE-Project/sophos_range_cloud

#init terraform modules
cd ..\terraform\aws\local
terraform init 
cd ..\..\..

#create python virtual environment
python -m venv venv
venv\Scripts\activate

#install requirements
python -m pip install -r requirements.txt



