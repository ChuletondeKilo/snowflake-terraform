terraform {
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "2.8.0"
    }
  }

  backend "local" {
    path = "./terraform_prod.tfstate"
  }
}

provider "snowflake" {
  user    = "psole"
  account_name = "TCCBYYI-LJ40274.snowflakecomputing.com"
  role        = "ACCOUNT_ADMIN"
  authenticator          = "SNOWFLAKE_JWT"
  private_key            = file("~/.ssh/snowflake_key.p8")
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 30
  database            = var.database
  env_name            = var.env_name
}