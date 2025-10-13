variable "env_name" {
  type        = string
  default     = "DEV"
  description = "values: PROD, DEV"
}

variable "db_roles" {
  type        = map(string)
  description = "Database Roles id's"
}

variable "warehouses" {
  type        = map(string)
  description = "Warehouses id's"
}