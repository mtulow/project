


variable "snowsql_password" {
  description   = "Snowflake user password."
  sensitive     = true
}

variable "snowflake_warehouse_name" {
  description   = "Name of the Snowflake warehouse responsible for handling Azure integration."
  default       = "azureint_wh"
}

variable "snowflake_database_name" {
  description   = "Name for the Snowflake database acting as our data warehouse."
  default       = "datawarehouse_db"
}

variable "snowflake_database_schema" {
  description   = "Name for the Snowflake database schema."
  default       = "staging"
}

variable "snowflake_service_role" {
  description   = "Name of service role in Snowflake."
  default       = "svc_role"
}

variable "snowflake_service_user" {
  description   = "Name of service user in Snowflake."
  default       = "svc_user"
}




