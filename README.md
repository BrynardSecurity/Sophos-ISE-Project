# <center>Sophos ISE Project</center>
<p align="center">
    <img src="https://img.shields.io/badge/made for-sophos%20sales%20engineering-blue">
</p>
<p align="center">
    <a href="https://github.com/BrynardSecurity/Sophos-ISE-Project">
        <img src="images/logo.png" alt="logo" width="250" height="250">
    </a>

## Table of contents :open_book:
* [about the project](#about-the-project) :question:
* [proof of concept](#proof-of-concept) :rocket:
* [getting started](#getting-started) :vertical_traffic_light:


### Acknowledgements <img src="images/clap.gif" width="30px">

This project was initiated by **Jeramy Kopacko**, with the help of **Christopher Glick** and **Ralph Brynard**. The stated goal of this collaboration is to build and develop tooling to eventually allow Sophos customers to test Sophos solutions head-to-head with competitor products. 

Inspiration for the current iteration of the project came directly from a recommendation by **Ben Davis**, who shared the source-code for Splunk's [**attack range project**](https://github.com/splunk/attack_range).

**Thank you to all who have contributed and who will continue to contribute!**

## About the Project :question:

However, the project has since evolved to also fill a role within the Sales Engineering team to generate consistent threat detection data to demonstrate Sophos solutions in pre-sales engagements. 



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