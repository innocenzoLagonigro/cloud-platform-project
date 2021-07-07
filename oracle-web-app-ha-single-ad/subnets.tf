# Create regional subnets in vcn

resource "oci_core_subnet" "subnet_lb" {
  cidr_block        = var.lb_subnet_cidr
  display_name      = "subnet-lb"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_virtual_network.vcn.id
  dhcp_options_id   = oci_core_virtual_network.vcn.default_dhcp_options_id
  route_table_id    = oci_core_route_table.rt-pub.id
  dns_label         = "subnetlb"

  provisioner "local-exec" {
    command = "sleep 5"
  }
}

resource "oci_core_subnet" "subnet_web_app" {
  cidr_block        = var.web_app_subnet_cidr
  display_name      = "subnet-web-app"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_virtual_network.vcn.id
  dhcp_options_id   = oci_core_virtual_network.vcn.default_dhcp_options_id
  route_table_id    = oci_core_route_table.rt-pub.id
  dns_label         = "subnetwebapp"
  provisioner "local-exec" {
    command = "sleep 5"
  }
}

resource "oci_core_subnet" "subnet_db" {
  cidr_block        = var.db_subnet_cidr
  display_name      = "subnet-db"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_virtual_network.vcn.id
  dhcp_options_id   = oci_core_virtual_network.vcn.default_dhcp_options_id
  route_table_id    = oci_core_route_table.rt-priv.id
  prohibit_public_ip_on_vnic = true
  dns_label         = "subnetdb"

  provisioner "local-exec" {
    command = "sleep 5"
  }
}

