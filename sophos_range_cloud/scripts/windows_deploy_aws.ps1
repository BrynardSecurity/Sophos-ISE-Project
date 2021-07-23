#Set execution policy to allow script to run
Set-ExecutionPolicy Bypass -Scope Process -Force

#Set TLS version to 1.2+
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Install chocolatey package manager
Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install the required packages
$packages = @('python','awscli','git','terraform')

ForEach ($i in $packages){
    choco install $i -y 
}

#init terraform modules
cd terraform\aws\local
terraform init 
cd ..\..\..

#create python virtual environment
python -m venv venv
venv\Scripts\activate

#install requirements
python -m pip install -r requirements.txt



