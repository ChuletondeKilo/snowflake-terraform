resource "snowflake_database" "silver_db" {
  name                        = "DB_SILVER_${var.env_name}"
  data_retention_time_in_days = 90
}

resource "snowflake_schema" "layer1_zone" {
  database = snowflake_database.silver_db.name
  name     = "LAYER1"
}

resource "snowflake_schema" "layer2_zone" {
  database = snowflake_database.silver_db.name
  name     = "LAYER2"
}