output "loadbalancer_public_url" {
  value = "http://${oci_load_balancer.lb1.ip_addresses[0]}"
}
