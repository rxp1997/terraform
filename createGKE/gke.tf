resource "google_container_cluster" "mycluster" {
  project = "${var.project_id}"
  name    = "${var.cluster_name}"
  zone    = "us-central1-b"
  description = "${var.cluster_description}"
  initial_node_count = 1
  
  additional_zones = [
    "us-central1-f",
    "us-central1-a"
  ]

  private_cluster = false

  node_config {
    image_type = "COS"
    machine_type = "custom-1-1024"
    disk_size_gb = 10
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = "${var.cluster_labels}"
    tags = "${var.node_tags}"
  }
  
  maintenance_policy {
    daily_maintenance_window {
      start_time = "08:00"
    }
  }

  logging_service = "logging.googleapis.com"
  monitoring_service = "monitoring.googleapis.com"

}

// output "client_certificate" {
//   value = "${google_container_cluster.mycluster.master_auth.0.client_certificate}"
// }
// 
// output "client_key" {
//   value = "${google_container_cluster.mycluster.master_auth.0.client_key}"
// }
// 
// output "cluster_ca_certificate" {
//   value = "${google_container_cluster.mycluster.master_auth.0.cluster_ca_certificate}"
// }
