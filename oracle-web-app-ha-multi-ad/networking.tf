# Create VCN

resource "oci_core_virtual_network" "vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_name
  dns_label      = var.vcn_dns_label
}

# Create internet gateway to allow public internet traffic

resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_ocid
  display_name   = "ig-gateway"
  vcn_id         = oci_core_virtual_network.vcn.id
}

# Create NAT gateway

resource "oci_core_nat_gateway" "nat_gw" {
    compartment_id = var.compartment_ocid
    display_name = "nat_gateway"
    vcn_id = oci_core_virtual_network.vcn.id
}
