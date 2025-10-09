resource "snowflake_warehouse" "wh_developers" {
  name           = "WH_DEVELOP_${var.env_name}"
  warehouse_size = var.env_name == "PROD" ? "MEDIUM" : "XSMALL"
  auto_resume    = true
  auto_suspend   = 1
}