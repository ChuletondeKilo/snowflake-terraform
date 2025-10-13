resource "snowflake_database" "gold_db" {
  name                        = "DB_GOLD_${var.env_name}"
  data_retention_time_in_days = 90
}

resource "snowflake_schema" "gold1" {
  database = snowflake_database.gold_db.name
  name     = "GOLD1"
}

resource "snowflake_schema" "gold2" {
  database = snowflake_database.gold_db.name
  name     = "GOLD2"
}