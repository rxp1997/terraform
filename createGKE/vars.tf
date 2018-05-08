variable "project_id" {
  type = "string"
}

variable "cluster_name" {
  type = "string"
}

variable "cluster_description" {
  type = "string"
}

variable "credentials" {
  description = "Credentials file location"
  type        = "string"
}

variable "cluster_labels" {
  description = "Cluster-level labels"
  type        = "map"
  default     = {}
}

variable "node_tags" {
  description = "node tags for routing/fw rules"
  type        = "list"
  default     = []
}

provider "google" {
  project     = "${var.project_id}"
  credentials = "${file(var.credentials)}"
}
