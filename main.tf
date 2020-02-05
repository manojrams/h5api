provider "google" {
  project = "prueba-gke"
  region = "us-central-1"
  zone = "us-central1-a"
}

resource "google_container_cluster" "primary" {
    name = "k8s-test"
    location = "us-central1-a"

    master_auth {
    username = ""
    password = ""
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 3
  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"
    metadata = {
      disable-legacy-endpoints = "true"
    }
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
