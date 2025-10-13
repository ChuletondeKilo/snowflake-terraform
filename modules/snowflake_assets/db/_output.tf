output "databases" {
  description = "Map of all databases and their fully qualified names"
  value = {
    bronze_db = snowflake_database.bronze_db.fully_qualified_name
    silver_db = snowflake_database.silver_db.fully_qualified_name
    gold_db   = snowflake_database.gold_db.fully_qualified_name
  }
}

output "schemas" {
  description = "Map of all schemas and their fully qualified names"
  value = {
    landing_zone = snowflake_schema.landing_zone.fully_qualified_name
    staging_zone = snowflake_schema.staging_zone.fully_qualified_name
    stages       = snowflake_schema.stages.fully_qualified_name
    layer1       = snowflake_schema.layer1.fully_qualified_name
    layer2       = snowflake_schema.layer2.fully_qualified_name
    gold1        = snowflake_schema.gold1.fully_qualified_name
    gold2        = snowflake_schema.gold2.fully_qualified_name
  }
}