

# Create snowflake warehouse
resource "snowflake_warehouse" "wh" {
  name           = "TF_DEMO_WH"
  warehouse_size = "xsmall"

  auto_suspend = 60

  query_acceleration_max_scale_factor = 0
}


# Create snowflake database & schema
resource "snowflake_database" "db" {
  name      = "${var.snowflake_database_name}"
}
resource "snowflake_schema" "schema" {
  name      = "${var.snowflake_database_schema}"  
}


# Create service user & role
resource "snowflake_user" "user" {
  name              = "${var.snowflake_service_user}"
  default_role      = snowflake_role.role.name
  default_warehouse = snowflake_warehouse.wh.name
  default_namespace = "${snowflake_database.db.name}.${snowflake_schema.schema.name}"
    
}
resource "snowflake_role" "role" {
  name      = "${var.snowflake_service_role}"
}


# Grant warehouse, database & schema access to service role
resource "snowflake_warehouse_grant" "grant" {
  warehouse_name    = snowflake_warehouse.wh.name
  privilege         = "USAGE"
  roles             = [snowflake_role.role.name]
  with_grant_option = false
}
resource "snowflake_database_grants" "grant" {
  database_name     = snowflake_database.db.name
  privilege         = "USAGE"
  roles             = [snowflake_role.role.name]
  with_grant_option = false
}
resource "snowflake_schema_grant" "grant" {
  schema_name       = snowflake_schema.schema.name
  privilege         = "USAGE"
  roles             = [snowflake_role.role.name]
  with_grant_option = false
}


# Grant role to user
resource "snowflake_role_grants" "grants" {
  role_name = snowflake_role.role.name
  users     = [snowflake_user.user.name] 
}

