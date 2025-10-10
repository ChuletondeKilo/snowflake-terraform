resource "snowflake_warehouse" "wh_developers" {
  name           = "WH_DEVELOP_${var.env_name}"
  warehouse_size = var.env_name == "PROD" ? "MEDIUM" : "XSMALL"
  warehouse_type                      = "STANDARD"
  max_cluster_count                   = 1
  min_cluster_count                   = 1
  auto_suspend                        = 60
  auto_resume                         = true
  initially_suspended                 = true
  resource_monitor                    = var.monitors["rsc_monitor_developers"]
  comment                             = "An example warehouse."
  enable_query_acceleration           = false

  max_concurrency_level               = 5
  statement_queued_timeout_in_seconds = 900
  statement_timeout_in_seconds        = 7200
}

resource "snowflake_warehouse" "wh_integration_svc1" {
  name           = "WH_INT_SVC1_${var.env_name}"
  warehouse_size = var.env_name == "PROD" ? "MEDIUM" : "XSMALL"
  warehouse_type                      = "STANDARD"
  max_cluster_count                   = 1
  min_cluster_count                   = 1
  auto_suspend                        = 60
  auto_resume                         = true
  initially_suspended                 = true
  resource_monitor                    = var.monitors["rsc_monitor_integration"]
  comment                             = "An example warehouse."
  enable_query_acceleration           = false

  max_concurrency_level               = 5
  statement_queued_timeout_in_seconds = 900
  statement_timeout_in_seconds        = 7200
}

resource "snowflake_warehouse" "wh_transform" {
  name           = "WH_TRANSFORM_${var.env_name}"
  warehouse_size = var.env_name == "PROD" ? "MEDIUM" : "XSMALL"
  warehouse_type                      = "STANDARD"
  max_cluster_count                   = 1
  min_cluster_count                   = 1
  auto_suspend                        = 60
  auto_resume                         = true
  initially_suspended                 = true
  resource_monitor                    = var.monitors["rsc_monitor_transform"]
  comment                             = "An example warehouse."
  enable_query_acceleration           = false

  max_concurrency_level               = 5
  statement_queued_timeout_in_seconds = 900
  statement_timeout_in_seconds        = 7200
}

resource "snowflake_warehouse" "wh_consumer_svc1" {
  name           = "WH_CONSUMER_SVC1_${var.env_name}"
  warehouse_size = var.env_name == "PROD" ? "MEDIUM" : "XSMALL"
  warehouse_type                      = "STANDARD"
  max_cluster_count                   = 1
  min_cluster_count                   = 1
  auto_suspend                        = 60
  auto_resume                         = true
  initially_suspended                 = true
  resource_monitor                    = var.monitors["rsc_monitor_consumer"]
  comment                             = "An example warehouse."
  enable_query_acceleration           = false

  max_concurrency_level               = 5
  statement_queued_timeout_in_seconds = 900
  statement_timeout_in_seconds        = 7200
}