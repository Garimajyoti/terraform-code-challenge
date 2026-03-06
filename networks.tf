# Internal networks
resource "docker_network" "internal" {
  for_each = toset(var.internal_network_names)
  name     = each.value
}

# External network
resource "docker_network" "external" {
  name = var.external_network_name
}