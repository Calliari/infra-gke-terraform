variable "region" {
  description = "Location, where the resources will be create at"
  default = "europe-west2"
}
variable "project_id" {
  default     = "gke-terraform-246614"
}
variable "account_name" {
  default     = "gke-terraform"
  description = "the account name"
}
variable "cluster_name" {
  default = "wordpress-demo-cluster"
  description = "Give a name for the cluster"

}
