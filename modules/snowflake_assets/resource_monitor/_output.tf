output "monitors" {
  description = "Map of all resource monitors and their fully qualified names"
  value = {
    rsc_monitor_developers  = snowflake_resource_monitor.rsc_monitor_developers.fully_qualified_name
    rsc_monitor_integration = snowflake_resource_monitor.rsc_monitor_integration.fully_qualified_name
    rsc_monitor_transform   = snowflake_resource_monitor.rsc_monitor_transform.fully_qualified_name
    rsc_monitor_consumer    = snowflake_resource_monitor.rsc_monitor_consumer.fully_qualified_name
  }
}