# Create a VM instance & provisioning your resources
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started#provisioning-your-resources
resource "google_compute_instance" "tf-google-compute-instance-miguel" {
  name         = "tf-google-compute-instance-miguel"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.tf-google-compute-network-miguel.self_link
    access_config {
    }
  }

}

resource "google_compute_network" "tf-google-compute-network-miguel" {
  name                    = "tf-google-compute-network-miguel"
  auto_create_subnetworks = "true"
}