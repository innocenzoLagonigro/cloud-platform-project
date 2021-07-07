## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "loadbalancer_public_url" {
  value = "http://${oci_load_balancer.lb1.ip_addresses[0]}"
}
