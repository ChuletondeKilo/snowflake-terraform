###################################
######### BRONZE DB ROLES #########
###################################

# BRONZE STAGE USAGES
resource "snowflake_grant_privileges_to_database_role" "bronze_stage_usage_all" {
  privileges         = ["USAGE"]
  database_role_name = snowflake_database_role.bronze_stage_usage.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "STAGES"
      in_schema          = var.schemas["stages"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_stage_usage_future" {
  privileges         = ["USAGE"]
  database_role_name = snowflake_database_role.bronze_stage_usage.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "STAGES"
      in_schema          = var.schemas["stages"]
    }
  }
}

# READ ROLE ON BRONZE_DB
resource "snowflake_grant_privileges_to_database_role" "bronze_schema_usage_all" {
  privileges         = ["USAGE"]
  database_role_name = snowflake_database_role.rl_read_bronze.fully_qualified_name

  on_schema {
    all_schemas_in_database = var.databases["bronze_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_schema_usage_future" {
  privileges         = ["USAGE"]
  database_role_name = snowflake_database_role.rl_read_bronze.fully_qualified_name

  on_schema {
    future_schemas_in_database = var.databases["bronze_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_select_tables_all" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_bronze.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = var.databases["bronze_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_select_tables_future" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_bronze.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.databases["bronze_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_select_views_all" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_bronze.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_database        = var.databases["bronze_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_select_views_future" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_bronze.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.databases["bronze_db"]
    }
  }
}

# RW ROLE ON BRONZE_DB

resource "snowflake_grant_privileges_to_database_role" "bronze_usage_and_schema_mng_future" {
  privileges         = ["USAGE", "CREATE TABLE", "CREATE VIEW"]
  database_role_name = snowflake_database_role.rl_rw_bronze.fully_qualified_name

  on_schema {
    future_schemas_in_database = var.databases["bronze_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_usage_and_schema_mng_all" {
  privileges         = ["USAGE", "CREATE TABLE", "CREATE VIEW"]
  database_role_name = snowflake_database_role.rl_rw_bronze.fully_qualified_name

  on_schema {
    all_schemas_in_database = var.databases["bronze_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_rw_to_tables_all" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_bronze.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = var.databases["bronze_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_rw_to_tables_future" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_bronze.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.databases["bronze_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_rw_to_views_all" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_bronze.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_database        = var.databases["bronze_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "bronze_rw_to_views_future" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_bronze.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.databases["bronze_db"]
    }
  }
}

###################################
######### SILVER DB ROLES #########
###################################

# READ ROLE ON SILVER_DB
resource "snowflake_grant_privileges_to_database_role" "silver_schema_usage_all" {
  privileges         = ["USAGE"]
  database_role_name = snowflake_database_role.rl_read_silver.fully_qualified_name

  on_schema {
    all_schemas_in_database = var.databases["silver_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "silver_schema_usage_future" {
  privileges         = ["USAGE"]
  database_role_name = snowflake_database_role.rl_read_silver.fully_qualified_name

  on_schema {
    future_schemas_in_database = var.databases["silver_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "silver_select_tables_all" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_silver.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = var.databases["silver_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "silver_select_tables_future" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_silver.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.databases["silver_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "silver_select_views_all" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_silver.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_database        = var.databases["silver_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "silver_select_views_future" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_silver.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.databases["silver_db"]
    }
  }
}

# RW ROLE ON SILVER_DB

resource "snowflake_grant_privileges_to_database_role" "silver_usage_and_schema_mng_all" {
  privileges         = ["USAGE", "CREATE TABLE", "CREATE VIEW"]
  database_role_name = snowflake_database_role.rl_rw_silver.fully_qualified_name

  on_schema {
    all_schemas_in_database = var.databases["silver_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "silver_usage_and_schema_mng_future" {
  privileges         = ["USAGE", "CREATE TABLE", "CREATE VIEW"]
  database_role_name = snowflake_database_role.rl_rw_silver.fully_qualified_name

  on_schema {
    future_schemas_in_database = var.databases["silver_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "silver_rw_to_tables_all" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_silver.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = var.databases["silver_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "silver_rw_to_tables_future" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_silver.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.databases["silver_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "silver_rw_to_views_all" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_silver.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_database        = var.databases["silver_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "silver_rw_to_views_future" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_silver.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.databases["silver_db"]
    }
  }
}


###################################
######### GOLD DB ROLES #########
###################################

# READ ROLE ON GOLD_DB
resource "snowflake_grant_privileges_to_database_role" "gold_schema_usage_all" {
  privileges         = ["USAGE"]
  database_role_name = snowflake_database_role.rl_read_gold.fully_qualified_name

  on_schema {
    all_schemas_in_database = var.databases["gold_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "gold_schema_usage_future" {
  privileges         = ["USAGE"]
  database_role_name = snowflake_database_role.rl_read_gold.fully_qualified_name

  on_schema {
    future_schemas_in_database = var.databases["gold_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "gold_select_tables_all" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_gold.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = var.databases["gold_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "gold_select_tables_future" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_gold.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.databases["gold_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "gold_select_views_all" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_gold.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_database        = var.databases["gold_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "gold_select_views_future" {
  privileges         = ["SELECT"]
  database_role_name = snowflake_database_role.rl_read_gold.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.databases["gold_db"]
    }
  }
}

# RW ROLE ON gold_DB

resource "snowflake_grant_privileges_to_database_role" "gold_usage_and_schema_mng_all" {
  privileges         = ["USAGE", "CREATE TABLE", "CREATE VIEW"]
  database_role_name = snowflake_database_role.rl_rw_gold.fully_qualified_name

  on_schema {
    all_schemas_in_database = var.databases["gold_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "gold_usage_and_schema_mng_future" {
  privileges         = ["USAGE", "CREATE TABLE", "CREATE VIEW"]
  database_role_name = snowflake_database_role.rl_rw_gold.fully_qualified_name

  on_schema {
    future_schemas_in_database = var.databases["gold_db"]
  }
}

resource "snowflake_grant_privileges_to_database_role" "gold_rw_to_tables_all" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_gold.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = var.databases["gold_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "gold_rw_to_tables_future" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_gold.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.databases["gold_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "gold_rw_to_views_all" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_gold.fully_qualified_name

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_database        = var.databases["gold_db"]
    }
  }
}

resource "snowflake_grant_privileges_to_database_role" "gold_rw_to_views_future" {
  privileges         = ["SELECT", "INSERT", "DELETE", "TRUNCATE", "UPDATE"]
  database_role_name = snowflake_database_role.rl_rw_gold.fully_qualified_name

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.databases["gold_db"]
    }
  }
}