# ENVIRONMENTs
locals {
  env         = terraform.workspace
  environment = local.env_name[local.env]
  env_name = {
    "PRODUCTION"     = "production"
    "DEVELOPMENT" = "development"
  }

  # ======================================================================

  container_cluster = local.numbers_container_cluster[local.env]
  numbers_container_cluster = {
    "PRODUCTION"     = 4
    "DEVELOPMENT" = 2
  }

  # numbers of nodes on the pool
  container_node_pool = "${lookup(local.number_container_node_pool,local.env)}"
  number_container_node_pool = {
    "PRODUCTION" = 2
    "DEVELOPMENT" = 1
  }
}
