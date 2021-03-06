# Variables
variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "ssh_private_key" {}
variable "ATP_password" {}
variable "availablity_domain_name" {
  type = string
  default = "Uocm:FRA-AD-1"
}
variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.3"
}

variable "oracle_instant_client_version" {
#  default     = "21.1"
   default     = "19.10"
}

variable "oracle_instant_client_version_short" {
#  default     = "21"
  default     = "19.10"
}

# OS Images
variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

# Networking 
variable "vcn_cidr" {
  description = "cidr block of VCN"
  type        = string
  default = "10.0.0.0/16"
}

variable "vcn_name" {
  description = "user-friendly name of to use for the vcn to be appended to the label_prefix"
  type = string
  default = "haproject-vcn"
}

variable "vcn_dns_label" {
  description = "A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet"
  type = string
  default = "haproject"
}

variable "lb_subnet_cidr" {
  description = "The CIDR for the public subnet that will contain the load balancers"
  type = string
  default = "10.0.0.0/24"
}

variable "web_app_subnet_cidr" {
  description = "The CIDR for the public subnet that will contain the web servers"
  type = string
  default = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  description = "The CIDR for the public subnet that will contain the data tier"
  type = string
  default = "10.0.2.0/24"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "7.9"
}

variable "instance_shape" {
   default = "VM.Standard.E3.Flex"
}

variable "instance_flex_shape_ocpus" {
    default = 1
}

variable "instance_flex_shape_memory" {
    default = 10
}

variable "ssh_public_key" {
  default = ""
}

variable "lb_shape" {
  default = "flexible"
}

variable "flex_lb_min_shape" {
  default = "10"
}

variable "flex_lb_max_shape" {
  default = "100"
}

variable "ATP_private_endpoint" {
  default = true
}

variable "ATP_free_tier" {
  default = false
}

variable "ATP_database_cpu_core_count" {
  default = 1
}

variable "ATP_database_data_storage_size_in_tbs" {
  default = 1
}

variable "ATP_database_db_name" {
  default = "WebAppDB"
}

variable "ATP_database_db_version" {
  default = "19c"
}

variable "ATP_database_defined_tags_value" {
  default = "value"
}

variable "ATP_database_display_name" {
  default = "WebAppAutonomousDB"
}

variable "ATP_database_freeform_tags" {
  default = {
    "Owner" = "ATP"
  }
}

variable "ATP_database_license_model" {
  default = "LICENSE_INCLUDED"
}

variable "ATP_tde_wallet_zip_file" {
  default = "tde_wallet_aTFdb.zip"
}

variable "ATP_private_endpoint_label" {
  default = "AutonomousDBPrivateEndpoint"
}

variable  "ATP_data_guard_enabled" {
  default = false 
  type = bool
}

variable "ATP_auto_scaling_enabled" {
  default = false 
  type = bool
}

# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex",
    "VM.Standard.A1.Flex",
    "VM.Optimized3.Flex"
  ]
}

# Checks if is using Flexible Compute Shapes
locals {
  is_flexible_node_shape = contains(local.compute_flexible_shapes, var.instance_shape)
}

