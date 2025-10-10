output "monitors" {
  description = "Map of all wh and their fully qualified names"
  value = {
    wh_developers     = snowflake_warehouse.wh_developers.fully_qualified_name
    wh_integration_svc1   = snowflake_warehouse.wh_integration_svc1.fully_qualified_name
    wh_transform      = snowflake_warehouse.wh_transform.fully_qualified_name
    wh_consumer_svc1      = snowflake_warehouse.wh_consumer_svc1.fully_qualified_name
  }
}