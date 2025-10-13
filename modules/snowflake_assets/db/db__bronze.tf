resource "snowflake_database" "bronze_db" {
  name                        = "DB_BRONZE_${var.env_name}"
  data_retention_time_in_days = 90
}

resource "snowflake_schema" "landing_zone" {
  database = snowflake_database.bronze_db.name
  name     = "LANDING_ZONE"
}

resource "snowflake_schema" "stages" {
  database = snowflake_database.bronze_db.name
  name     = "STAGES"
}

resource "snowflake_schema" "staging_zone" {
  database = snowflake_database.bronze_db.name
  name     = "STAGING_ZONE"
}