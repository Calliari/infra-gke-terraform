resource "google_container_cluster" "cluster" {
  name       = "${var.cluster_name}"
  location   = "${var.region}"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count = local.container_cluster

  master_auth {
    username = "kube-user"
    password = "gdcodnPSKswn5bcKa-pwd"

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "${var.cluster_name}"
  location   = "${var.region}"
  cluster    = "${google_container_cluster.cluster.name}"
  node_count = local.container_node_pool

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
