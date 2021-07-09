<div class="header">
    <h1 align="center">Sophos ISE Project</h1>
    <p align="center">
    <img src="https://img.shields.io/badge/made%20by-RalphBrynard-blue">
</div>
<!-- logo -->
</br>
<p align="center">
    <a href="https://github.com/BrynardSecurity/Sophos-ISE-Project">
        <img src="../images/logo.png" alt="logo" width="250" height="250">
    </a>
    <h2 align="center">Sophos ISE Project</h3>
</p>

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
