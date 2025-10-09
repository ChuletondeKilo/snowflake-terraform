module "databases_and_schemas" {
  source   = "./db"
  env_name = var.env_name
  
}

module "warehouses" {
  source   = "./wh"
  env_name = var.env_name
  
}