module "databases_and_schemas" {
  source   = "./db"
  env_name = var.env_name
  
}

module "resource_monitors" {
  source   = "./resource_monitor"
  env_name = var.env_name
  
}

module "warehouses" {
  source   = "./wh"
  env_name = var.env_name
  monitors = module.resource_monitors.monitors
  
  depends_on = [ module.resource_monitors ]
}