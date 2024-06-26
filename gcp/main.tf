#You don't really need required_providers for this VM, but it is best pactice :-/
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.51.0"
    }
  }
}


provider "google" {
  #Uncomment the credentials here and in the variables file if you are using a service account json file
  #Insteal of gcloud auth application-default login
  # credentials = file(var.credentials)
  project = var.project
  region  = var.region
}

# Read in script file
locals {
  script_content = file("../DockerInstall/install_docker.sh")
  flag_content = file("../date_flag.py")
}

resource "google_compute_instance" "vm_instance" {
  name         = "ubuntu-docker"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      #Find these in gcloud sdk by running gcloud compute images list|grep <what you are looking for e.g. ubuntu>
      image = "ubuntu-2004-focal-v20240307b"
    }
  }

  network_interface {
    network = "default"
    #You need access_config in order to get the public IP printed
    access_config{

    }
  }

  # Use the content of the script file in the metadata_startup_script
  metadata_startup_script = <<-EOF
    #!/bin/bash
    ls -lah /etc |grep flag >> /home/gary/files_present.txt
    if [ ! -f /etc/flag.txt ];
    then
      sudo apt-get update
      sudo apt-get install -y gcloud
      echo '${local.script_content}' > /tmp/install_docker.sh
      echo '${local.flag_content}' > /tmp/date_flag.py
      chmod +x /tmp/install_docker.sh
      chmod +x /tmp/date_flag.py
      #Below command is just to show root is executing this script
      #whoami >> /usr/bin/runner_id
      bash /tmp/install_docker.sh
      /usr/bin/python3 /tmp/date_flag.py
    else
      exit 0
    fi
  EOF
}

output "public_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}
