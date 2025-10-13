resource "snowflake_database_role" "bronze_stage_usage" {
  database = var.databases["bronze_db"]
  name     = "RL_BRONZE_STAGE_USAGE_${var.env_name}"
  comment  = "Database Role for Read&Write access to ${var.env_name} Bronze Database"
}

resource "snowflake_database_role" "rl_rw_bronze" {
  database = var.databases["bronze_db"]
  name     = "RL_RW_BRONZE_${var.env_name}"
  comment  = "Database Role for Read&Write access to ${var.env_name} Bronze Database"
}

resource "snowflake_database_role" "rl_read_bronze" {
  database = var.databases["bronze_db"]
  name     = "RL_READ_BRONZE_${var.env_name}"
  comment  = "Database Role for Read access to ${var.env_name} Bronze Database"
}

resource "snowflake_database_role" "rl_rw_silver" {
  database = var.databases["silver_db"]
  name     = "RL_RW_SILVER_${var.env_name}"
  comment  = "Database Role for Read&Write access to ${var.env_name} silver Database"
}

resource "snowflake_database_role" "rl_read_silver" {
  database = var.databases["silver_db"]
  name     = "RL_READ_SILVER_${var.env_name}"
  comment  = "Database Role for Read access to ${var.env_name} silver Database"
}

resource "snowflake_database_role" "rl_rw_gold" {
  database = var.databases["gold_db"]
  name     = "RL_RW_GOLD_${var.env_name}"
  comment  = "Database Role for Read&Write access to ${var.env_name} gold Database"
}

resource "snowflake_database_role" "rl_read_gold" {
  database = var.databases["gold_db"]
  name     = "RL_READ_GOLD_${var.env_name}"
  comment  = "Database Role for Read access to ${var.env_name} gold Database"
}

resource "snowflake_database_role" "rl_usage_landing_stages" {
  database = var.databases["bronze_db"]
  name     = "RL_USAGE_LANDING_STAGES_${var.env_name}"
  comment  = "Database Role for Landing ${var.env_name} Stage usage"
}

resource "snowflake_database_role" "rl_manage_stages" {
  database = var.databases["bronze_db"]
  name     = "RL_MANAGE_STAGES_${var.env_name}"
  comment  = "Database Role for Stage creation in ${var.env_name}"
}
