variable "env_name" {
  type        = string
  default     = "DEV"
  description = "values: PROD, DEV"
}

variable "monitors" {
  type        = map(string)
  description = "Resource monitors id's"
}
