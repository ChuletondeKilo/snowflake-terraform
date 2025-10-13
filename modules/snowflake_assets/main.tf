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

  depends_on = [module.resource_monitors]
}

module "database_roles" {
  source    = "./db_role"
  env_name  = var.env_name
  databases = module.databases_and_schemas.databases
  schemas   = module.databases_and_schemas.schemas

  depends_on = [module.databases_and_schemas]
}

module "functional_roles" {
  source     = "./functional_role"
  env_name   = var.env_name
  db_roles   = module.database_roles.db_roles
  warehouses = module.warehouses.warehouses

  depends_on = [module.database_roles]
}