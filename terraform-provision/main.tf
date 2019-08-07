provider "google" {
  credentials = "${file("google-account.json")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}
