# Setting up a VM and Installing Docker and Docker Compose with Terraform:
Purpose: Bash Scripts to install Terraform and deploy docker and docker compose to cloud VMs 

<b>NOTE:</b> These scripts have been tested on Linux Mint and Ubuntu only

## Overview:

Once you have cloned this repo you can simply run <br><br>
```chmod +x TerraformInstall```<br><br>
and then <br><br>
```./TerraformInstall```<br><br>

### GCP:
Make sure you have an SSH public key generated and placed in the metadata for Compute Engine in your GCP Acount

You will need to update the name to add the docker group in DockerInstall/install_docker.sh to the user name you will be using on the instance

You will need to authenticate with gcloud using:<br>
```gcloud auth application-default login```<br><br>
or if you are using a service account, add the path to your json key file in the variables.tf file<br><br>

You can then simply run<br><br>
```terraform init```<br>
```terraform apply```<br>
And then connect to the instance using the IP Address output

### TODO
Need to create a terraform file for AWS

Add section to add SSH Key in terraform files

