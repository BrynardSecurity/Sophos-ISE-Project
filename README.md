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
            <li><a href="#proof-of-concept">Proof of concept</a> 
            <li><a href="#Demo-AWS">Demo</a>
        </ol>
</details>

<!-- about the project -->
## About the Project

This project was initiated by Jeramy Kopacko, with the help of Christopher Glick and Ralph Brynard, with the intent to create a <strong>Sophos Sales Experience</strong>, whereby Sophos customers can deploy an ephemeral development environment to actively test competing solutions with Sophos Central Intercept X Advanced. 

The goal of the project is two-fold:

<ul>
    <li> To utilize IaC and DevOps concepts and technologies to build ephemeral environments for generating threat case data to equip the Sales Engineering teams to effectively and efficiently demonstrate Sophos solutions with real-world automated simulations. 
    <li> To perform head-to-head real-world tests with independent third-party attack emulation tools (Atomic Red Team, MITRE Caldera, etc...) to collect real-world competitive intelligence data. The secondary goal may also include providing a platform for customers to run head-to-head tests against Sophos and other third-party vendors to compare the performance of competitive solutions with Sophos solutions.
</ul>

## Proof of Concept

<p>
Splunk has developed the open-source project, <a href="https://github.com/splunk/attack_range">Attack Range</a>, as a "detection development platform." This project addresses three main challenges in detection engineering:
<ol>
    <li> Quickly and consistently build a small ephemeral lab environment that is as close as possible to a production environment.
    <li> The attack range performs attack simulation using different engines, including Atmoc Red Team and Caldera, as well as an ad-hoc Kali Linux machine for additional testing.
    <li> The project integrates seamlessly into an CI/CD pipeline to automate detection rule testing, or alternatively, generation of detection data for threat case creation.
</ol>
<p>
The tool utilizes terraform, and ansible to provision the environment, and natively supports AWS and Azure. A local version of the project utilizes Vagrant and VirtualBox for local environment automation.
</p>
<p>
The Sophos project would ultimately retain the same functionality as the Splunk attack_range projects. However, support for Public Cloud and local attack range builds should be available from the same project. For local builds, support for VMWare Workstation, VirtualBox, VSphere, and Hyper-V should be available with Terraform still serving at the provisioner for those platforms as well. However, Vagrant support may be preferrable as we can build pre-defined vagrant boxes which could be utilized as well. To-that-end, implementing packer for custom image/template builds which can be utilized by Terraform as well would also be ideal.
</p>

## Demo - AWS 

<h3 align="left">Configuring and Building</h2>
<p>
First configure the environment to execute the simulated attack data.
<p>
<img src="images/attack_range_configure.gif">
</p>
<p>
With the configuration set, we can now build the environment. The Splunk project is limited to Windows Server AMI's in AWS at the moment, however, it is possible to upload a custom Windows 10 AMI and utilize this image in the AWS build environment. 
</p>
<p>
<img src="images/attack_range_build.gif">
</p>
The project will build the AWS environment and allow us to being running our attacks on the instances. 
</p>
<p>
<img src="images/attack_range_ec2.png">
</p>
<p>Once the environment is built, we can view the list of hosts to start executing our attack simulations.</p>
<p><img src="images/attack_range_show.gif"></p>
<h3 align="left">Attack Simulation</h3>
<p>With the environment built, we'll initiate a simulated attack using the MITRE ATT&CK Tactic, T1589.001</p>
<p><img src="images/attack_range_attack.gif"></p>
<h3 align="left">Data Analysis</h3>
<p>The simulated attack triggers detections from Central Intercept X Advanced, and populates the events in the Threat Analysis Center</p>
<p><img src="images/attack_range_data.gif"></p>