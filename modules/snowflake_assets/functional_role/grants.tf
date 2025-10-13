# Relating Database Roles with Account roles

resource "snowflake_grant_database_role" "db_ingestion_role_grant" {
  database_role_name = var.db_roles["rl_rw_bronze"]
  parent_role_name   = snowflake_account_role.rl_ingest_svc1.fully_qualified_name
}

resource "snowflake_grant_database_role" "db_transform_role_grant_read_bronze" {
  database_role_name = var.db_roles["rl_read_bronze"]
  parent_role_name   = snowflake_account_role.rl_transform_dbt.fully_qualified_name
}

resource "snowflake_grant_database_role" "db_transform_role_grant_rw_silver" {
  database_role_name = var.db_roles["rl_rw_silver"]
  parent_role_name   = snowflake_account_role.rl_transform_dbt.fully_qualified_name
}

resource "snowflake_grant_database_role" "db_transform_role_grant_rw_gold" {
  database_role_name = var.db_roles["rl_rw_gold"]
  parent_role_name   = snowflake_account_role.rl_transform_dbt.fully_qualified_name
}

resource "snowflake_grant_database_role" "db_consumer_role_grant_read_gold" {
  database_role_name = var.db_roles["rl_read_gold"]
  parent_role_name   = snowflake_account_role.rl_consumer_pbi.fully_qualified_name
}

resource "snowflake_grant_database_role" "db_developer_role_grant_rw_bronze" {
  database_role_name = var.db_roles["rl_rw_bronze"]
  parent_role_name   = snowflake_account_role.rl_developers.fully_qualified_name
}

resource "snowflake_grant_database_role" "db_developer_role_grant_rw_silver" {
  database_role_name = var.db_roles["rl_rw_silver"]
  parent_role_name   = snowflake_account_role.rl_developers.fully_qualified_name
}

resource "snowflake_grant_database_role" "db_developer_role_grant_rw_gold" {
  database_role_name = var.db_roles["rl_rw_gold"]
  parent_role_name   = snowflake_account_role.rl_developers.fully_qualified_name
}

resource "snowflake_grant_database_role" "db_developer_role_grant_stage_usage" {
  database_role_name = var.db_roles["rl_manage_stages"]
  parent_role_name   = snowflake_account_role.rl_developers.fully_qualified_name
}

# Usage of each warehouse to the appropiate account role

resource "snowflake_grant_privileges_to_account_role" "wh_usage_ingest" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.rl_ingest_svc1.fully_qualified_name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouses["wh_integration_svc1"]
  }
}

resource "snowflake_grant_privileges_to_account_role" "wh_usage_transform" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.rl_transform_dbt.fully_qualified_name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouses["wh_transform"]
  }
}

resource "snowflake_grant_privileges_to_account_role" "wh_usage_consumer" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.rl_consumer_pbi.fully_qualified_name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouses["wh_consumer_svc1"]
  }
}

resource "snowflake_grant_privileges_to_account_role" "wh_usage_developers" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.rl_developers.fully_qualified_name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouses["wh_developers"]
  }
}