# This terraform script creates an autonomous database and the database wallet

resource "oci_database_autonomous_database" "ATPdatabase" {
  admin_password           = var.ATP_password
  compartment_id           = var.compartment_ocid
  cpu_core_count           = var.ATP_database_cpu_core_count
  data_storage_size_in_tbs = var.ATP_database_data_storage_size_in_tbs
  db_name                  = var.ATP_database_db_name
  db_version               = var.ATP_database_db_version
  display_name             = var.ATP_database_display_name
  freeform_tags            = var.ATP_database_freeform_tags
  license_model            = var.ATP_database_license_model
  is_free_tier             = var.ATP_free_tier
  nsg_ids                  = var.ATP_private_endpoint ? [oci_core_network_security_group.ATPSecurityGroup.id] : null   
  private_endpoint_label   = var.ATP_private_endpoint ? var.ATP_private_endpoint_label : null
  subnet_id                = var.ATP_private_endpoint ? oci_core_subnet.subnet_3.id : null   
  is_data_guard_enabled    = var.ATP_data_guard_enabled
}

resource "random_string" "wallet_password" {
  length  = 16
  special = true
}

resource "oci_database_autonomous_database_wallet" "ATP_database_wallet" {
  autonomous_database_id = oci_database_autonomous_database.ATPdatabase.id
  password               = random_string.wallet_password.result
  base64_encode_content  = "true"
}

