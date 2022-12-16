terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "0.53.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.36.0"
    }
  }
}

provider "snowflake" {
  # Configuration options
  username  = "mtulow"
  account   = "wd03530"
  region    = "us-central1.gcp"
  password  = "${var.snowsql_password}"
}

provider "azurerm" {
  # Configuration options
  features {}
}