# Setting up a VM and Installing Docker and Docker Compose with Terraform:
Purpose: Bash Scripts to install Terraform and deploy docker and docker compose to cloud VMs 

<b>NOTE:</b> These scripts have been tested on Linux Mint and Ubuntu only

## Overview:

Once you have cloned this repo you can simply run <br><br>
```chmod +x TerraformInstall```<br><br>
and then <br><br>
```./TerraformInstall```<br><br>


## Note: 
This script has only been tested on Linux Mint 20.1 Ulyssa and Linux Mint 20.2 Uma.
The last user to log in is added to the Docker group. You are most likely the last user to log into your system, but if you are on a multiuser system please be aware of this. 

Instructions:
Simply download the MintDockerInstall script and execute the following:

```sudo chmod +x MintDockerInstall```

```sudo ./MintDockerInstall```
or to install compose as well
```sudo ./MintDockerInstall all```

You will be prompted for the current users password once the script has completed. 
