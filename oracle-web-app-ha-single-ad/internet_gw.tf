# Create internet gateway to allow public internet traffic

resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_ocid
  display_name   = "ig-gateway"
  vcn_id         = oci_core_virtual_network.vcn.id
}

