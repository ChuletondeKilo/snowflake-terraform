variable "env_name" {
  type        = string
  default     = "DEV"
  description = "values: PROD, DEV"
}

variable "databases" {
  type        = map(string)
  description = "Databases id's"
}

variable "schemas" {
  type        = map(string)
  description = "Schemas id's"
}