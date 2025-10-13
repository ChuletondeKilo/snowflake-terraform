# Account Roles Creation

resource "snowflake_account_role" "rl_ingest_svc1" {
  name    = "RL_INGEST_SVC1_${var.env_name}"
  comment = "Service Role for SVC1 Ingestion into ${var.env_name} Bronze Database"
}

resource "snowflake_account_role" "rl_transform_dbt" {
  name    = "RL_TRANSFORM_DBT_${var.env_name}"
  comment = "Service Role for DBT transformation into ${var.env_name}"
}

resource "snowflake_account_role" "rl_consumer_pbi" {
  name    = "RL_CONSUMER_PBI_${var.env_name}"
  comment = "Service Role for PowerBI Gold Layer consumption in ${var.env_name}"
}

resource "snowflake_account_role" "rl_landing_stage_usage" {
  name    = "RL_BRONZE_STAGE_USAGE_${var.env_name}"
  comment = "Service Role for Bronze Stage Usage in ${var.env_name}"
}

resource "snowflake_account_role" "rl_developers" {
  name    = "RL_DEVELOPER_${var.env_name}"
  comment = "Service Role for Developers in ${var.env_name}"
}


# Retrieve SYSADMIN
resource "snowflake_grant_account_role" "grant_roles_to_sysadmin_ingest" {
  role_name        = snowflake_account_role.rl_ingest_svc1.fully_qualified_name
  parent_role_name = "SYSADMIN"
}

resource "snowflake_grant_account_role" "grant_roles_to_sysadmin_transform" {
  role_name        = snowflake_account_role.rl_transform_dbt.fully_qualified_name
  parent_role_name = "SYSADMIN"
}

resource "snowflake_grant_account_role" "grant_roles_to_sysadmin_consumer" {
  role_name        = snowflake_account_role.rl_consumer_pbi.fully_qualified_name
  parent_role_name = "SYSADMIN"
}

resource "snowflake_grant_account_role" "grant_roles_to_sysadmin_landing" {
  role_name        = snowflake_account_role.rl_landing_stage_usage.fully_qualified_name
  parent_role_name = "SYSADMIN"
}

resource "snowflake_grant_account_role" "grant_roles_to_sysadmin_developer" {
  role_name        = snowflake_account_role.rl_developers.fully_qualified_name
  parent_role_name = "SYSADMIN"
}
