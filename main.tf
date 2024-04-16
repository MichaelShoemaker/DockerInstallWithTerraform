provider "google" {
  project = var.project
  region  = var.region
}

# Read in script file
locals {
  script_content = file("./install_docker.sh")
}

resource "google_compute_instance" "vm_instance" {
  name         = "ubuntu-docker"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20240307b"
    }
  }

  network_interface {
    network = "default"
    #You need this in order to get the public IP printed
    access_config{

    }
  }

  # Use the content of the script file in the metadata_startup_script
  metadata_startup_script = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y gcloud
    echo '${local.script_content}' > /tmp/script.sh
    chmod +x /tmp/script.sh
    whoami >> /usr/bin/runner_id
    bash /tmp/script.sh
  EOF
}

output "public_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}
