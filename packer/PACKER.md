<div class="header">
    <h1 align="center">Sophos ISE Project</h1>
    <p align="center">
    <img src="https://img.shields.io/badge/made%20by-RalphBrynard-blue">

<!-- logo -->
</br>
<p align="center">
    <a href="https://github.com/BrynardSecurity/Sophos-ISE-Project">
        <img src="../images/logo.png" alt="logo" width="250" height="250">
    </a>
    <h2 align="center">Sophos ISE Project</h3>
    <div class="navbar">
        <a href="../README.md">Home</a>
    </div>
</div>
</p>


<div class="main">
<p align="left">
As mentioned previously, Packer is the build-tool of choice to build the base-images that will be used for this project. Packer allows us to automate our image build process, and ensures that the builds are consistent and replicable, and thus the templates that are created should be consistent and replicable. 
</p>
<p align="left">
But why do we need to build the images if we're simply using templates? The reason for this is two-fold:
<br>
<ul>
    <li> Anytime we create a template, the templates will "age", as they're typically never powered on and thus need to be powered on to update and patch. By automating the build process we can re-run our template builds regularly to ensure they're up-to-date.
    <li> While we could do this manually, we run the risk of potentially forgetting a step or breaking something. By automating the process we reduce the likely hood of this. This also means we can make stateful changes to the build templates rather than cloning the existing templates to apply a change or create a new template.
</ul>
</br>
</p>
<h2 align="left">Examples</h2>
<h3 align="left">Variables</h3>
<p align="left">
Packer supports variables for building images. For this particular project, I've elected to store sensitive variables, specifically the vsphere API authentication information in a variables.json file:

```
#This is an example of the variables.json file.

{
    "vsphere-server": "vcenter.contoso.com",
    "vsphere-user": "Administrator@vsphere.local",
    "vsphere-password": "S3cR3t!",
    "vsphere-datacenter": "Data_Center_Name",
    "vsphere-cluster": "Cluster_Name",
    "vsphere-network": "Virtual_Network",
    "vsphere-datastore": "Datastore_Name",
    "vsphere-folder": "VM_Folder_Name",
    "insecure-connection": "true",
    "vm-notes": "Notes detailing the build. Can include Build time: {{isotime}}"
}
```
<p align="left">
Any additional variables that will be consistent across all your builds should be defined in this variables.json file. 
<p>
<h3 align="left">Build File</h3>
</p>
The build file will provide the necessary data for packer to build the desired image. I've included two examples below; Windows Server and Linux.
</p>

<h4>Windows Server</h4>

```
{
	"description": "Packer Windows Server 2016 build template file.",
	"_comment": "Template file provides framework for subsequent packer builds.",
	"variables": {
		"os-iso-path": "[datastore] path/to/installer/windows2016.iso",
        "win-admin-password": "S3cR3t!"
	},

	"builders": [
		{
			"type": "vsphere-iso",

			"vcenter_server": "{{user `vsphere-server`}}",
			"username": "{{user `vsphere-user`}}",
			"password": "{{user `vsphere-password`}}",
			"datacenter": "{{user `vsphere-datacenter`}}",
			"cluster": "{{user `vsphere-cluster`}}",
			"datastore": "{{user `vsphere-datastore`}}",
			"folder": "{{user `vsphere-folder`}}",
			"insecure_connection": "{{user `insecure-connection`}}",

			"communicator": "winrm",
			"winrm_username": "Administrator",
			"winrm_password": "{{user `win-admin-password`}}",
			"winrm_timeout": "15m",

			"convert_to_template": "true",	

			"vm_name": "windows2016.gold",
			"guest_os_type": "windows9Server64Guest",
			
			"CPUs": 2,
			"RAM": 4096,
			"RAM_reserve_all": true,
			"firmware": "efi",
			"cdrom_type": "sata",

			"storage": [
				{
					"disk_size": 61440,
					"disk_thin_provisioned": true
				}
			],
			"disk_controller_type": "pvscsi",

			"network_adapters": [
				{
					"network": "{{user `vsphere-network`}}",
					"network_card": "vmxnet3"
				}
			],

			"notes": "{{user `vm-notes`}}",

			"iso_paths": [
				"{{user `os-iso-path`}}",
				"[] /vmimages/tools-isoimages/windows.iso"
			],

			"floppy_files": [
				"server_standard/autounattend.xml",
				"../drivers/pvscsi-win8/pvscsi.cat",
				"../drivers/pvscsi-win8/pvscsi.inf",
				"../drivers/pvscsi-win8/pvscsi.sys",
				"../drivers/pvscsi-win8/txtsetup.oem",
				"../scripts/2016/00-vmtools.ps1",
				"../scripts/2016/01-initialize.ps1",
				"../scripts/2016/03-systemsettings.ps1",
				"../scripts/2016/95-enablerdp.ps1"
			],

			"shutdown_command": "shutdown /f /s /t 10 /d p:4:1 /c \"Packer Complete\""
		}
	],
	"provisioners": [
		{
			"type": "powershell",
			"scripts": [
				"../scripts/2016/03-systemsettings.ps1",
				"../scripts/2016/95-enablerdp.ps1"
			]
		},
		{
			"type": "windows-restart",
			"restart_timeout": "30m"
		},
		{
			"type": "windows-update",
			"search_criteria": "IsInstalled=0",
			"filters": [
				"exclude:$_.Title -like '*Preview*'",
                "include:$true"
			]
		}
	]
}
```

<p>
The Windows packer build template above will automate the provisioning/creation of a Windows Server 2016 Virtual Machine template. The other components needed to create this virtual machine are:
<ul>
<li> autounattend.xml file to run an unattended installation of the Windows Server.
<li> any custom scripts to customize the provisioning of the server.
</ul>
<p>
I've included template build files, including the autounattend.xml files, custom scripts, and templates that include a base gold-image, as well as a custom gold-image that has CIXA Server pre-installed.
</p>
</p>
</p>
</div>

