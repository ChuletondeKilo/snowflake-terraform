terraform {
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "2.8.0"
    }
  }

  backend "local" {
    path = "./terraform_dev.tfstate"
  }
}

provider "snowflake" {
  user    = "psole"
  account_name = "LJ40274"
  organization_name = "TCCBYYI"
  role        = "ACCOUNTADMIN"
  authenticator          = "SNOWFLAKE_JWT"
  private_key            = file("~/.ssh/snowflake_key.p8")
}

module "snowflake_assets" {
  source              = "../modules/snowflake_assets"
  env_name            = var.env_name
  providers = {
    snowflake = snowflake  # <-- explicitly pass root provider
  }
}