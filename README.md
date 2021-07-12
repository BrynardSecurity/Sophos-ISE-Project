<div class="header">
    <h1 align="center">Sophos ISE Project</h1>
    <p align="center">
    <img src="https://img.shields.io/badge/made%20by-RalphBrynard-blue">
</div>
<!-- logo -->
</br>
<p align="center">
    <a href="https://github.com/BrynardSecurity/Sophos-ISE-Project">
        <img src="images/logo.png" alt="logo" width="250" height="250">
    </a>
    <h3 align="center">Sophos ISE Project</h3>
    <p align="center">
        Sophos Inside Sales Engineer demo project to jumpstart ISE and SE demo environments and scenario data.
    </p>
</p>
<!-- table of contents -->
<details open="open">
    <summary>Table of Contents</summary>
        <ol>
            <li><a href="#about-the-project">About The Project</a>
                <ul>
                <li><a href="#tooling">Tooling
                </ul>
            <li><a href="#getting-started">Getting Started</a>
            <li><a href="#usage">Usage</a>
            <li><a href="#roadmap">Roadmap</a>
            <li><a href="#contributing">Contributing</a>
            <li><a href="#license">License</a>
            <li><a href="#contact">Contact</a>
            <li><a href="#acknowledgements">Acknowledgements</a>
            </li>
        </ol>
</details>

<!-- about the project -->
## About the Project

This project was initiated by Jeramy Kopacko, with the help of Christopher Glick and Ralph Brynard, with the intent to create a <strong>Sophos Sales Experience</strong>, whereby Sophos customers can deploy an ephemeral development environment to actively test competing solutions with Sophos Central Intercept X Advanced. 

With this goal in mind, some of the core concepts underlying the architecture of this project include:

<ul>
    <li><strong> Base images that are built reliably, and repeatably.</strong>
    <li><strong> Infrastructure as code tooling that accomodates a variety of on-prem virtualization platforms as well as Public Cloud Infrastructure deployments.</strong>
    <li><strong> Configuration management tools to ensure consistent configuration across environments.</strong>
    <li><strong> Simulated attack scenarios and open-source tools to simulate various cyber-security attacks.</strong>
</ul>

As a result, a secondary function of this project is to utilize the repeatability and consistincy of the project to allow Sophos Inside Sales Engineers, Mid-Market, and Enterprise Sales Engineers to generate consistent data for threat case analysis, XDR queries, etc...


## Tooling

The project architecture can be broken into several phases:
<ul>
    <li><strong>Build Tools</strong>
    <li><strong>Infrastructure as Code Tools</strong>
    <li><strong>Provisioning Tools</strong>
    <li><strong>Execution Tools</strong>
</ul>

<h2 align="left">Build Tools</h2>
<p align="left">
The base image builds are accomplished with <a href="https://www.packer.io/">Hashicorp's Packer</a> utility to build the image templates. Packer was selected primarily because of it's integrations and compatibility with VMWare, Hyper-V, Azure, AWS, GCP, Docker, Kubernetes, etc... These integrations make packer an ideal toolset to ensure consistent configuration across multiple platforms and environments. 
</p>
<p align="left">
For this project I have built some base-line packer build templates for Windows 10, Windows Server 2016, and Windows Server 2019. These builds are configured for deployment in a VMWare vSphere environment, however, adding builders for Hyper-V, VirtualBox, VMWare Workstation, Azure, AWS, and GCP is planned.
</p>
<p align="left">
Read more about the packer build files and use-cases here:

<a href="packer/PACKER.md">Packer Build Templates.</a>
</p>

<h2 align="left">Infrastructure as Code Tools</h2>
<p align="left">
The infrastructure as Code Tooling used for this project is <a href="https://www.terraform.io/">Hashicorp Terraform</a>. Terraform is used as it also has integrations with on-prem hypervisor environments (VMWare, Hyper-V, etc...) as well as Public Cloud Environments. This makes it an ideal toolset for deploying the ephemeral demo environments on multiple platforms, thus making it very scalable.
</p>
<p align="left">
Terraform plans, the infrastructure build plans, can also be executed via Ansible, and also supports dynamic infrastructure chaining. 
</p>

<h2 align="left">Provisioning Tools</h2>
<p align="left">
The provisioning tools utilized in the project is <a href="https://www.ansible.com/"> Ansible</a>, and provides a robust solution for provisioning the environment once it's been deployed via Terraform. Ansible will provision the Windows VM's into an ephemeral domain environment, as well as completing the rest of the provisioning for the single-node Kubernetes cluster that will provide the basis for the Caldera/C2 server and configuring the Caldera agents to run our simulated attacks.
</p>

<h2 align="left">Execution Tools</h2>
<p align="left">
The execution tools haven't been fully defined at this stage. However, MITRE Caldera is a suitable candidate for the C2 server emulation to execute our simulated attacks. 
</p>

## Getting Started
