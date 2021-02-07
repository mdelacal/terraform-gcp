# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool#example-usage---using-a-separately-managed-node-pool-recommended
resource "google_container_cluster" "tf-google-container-cluster-miguel" {
  name     = "tf-google-container-cluster-miguel"
  location = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "tf-google-container-node-pool" {
  name       = "tf-google-container-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.tf-google-container-cluster-miguel.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "g1-small"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}