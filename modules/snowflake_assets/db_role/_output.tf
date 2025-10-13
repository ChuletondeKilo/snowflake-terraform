output "db_roles" {
  description = "Map of all Databse Roles and their fully qualified names"
  value = {
    rl_manage_stages = snowflake_database_role.rl_manage_stages.fully_qualified_name
    rl_read_bronze   = snowflake_database_role.rl_read_bronze.fully_qualified_name
    rl_rw_bronze     = snowflake_database_role.rl_rw_bronze.fully_qualified_name
    rl_read_silver   = snowflake_database_role.rl_read_silver.fully_qualified_name
    rl_rw_silver     = snowflake_database_role.rl_rw_silver.fully_qualified_name
    rl_read_gold     = snowflake_database_role.rl_read_gold.fully_qualified_name
    rl_rw_gold       = snowflake_database_role.rl_rw_gold.fully_qualified_name
  }
}