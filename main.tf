module "web_servers" {
  source = "./modules/container"

  for_each = {
    for idx, server in var.web_servers :
    idx => server
  }

  container_name = "${var.web_server_name_template}-${each.key}"

  image_name   = each.value.image_name
  image_tag    = each.value.image_tag
  networks     = each.value.attached_networks
  dns_servers  = each.value.dns_servers
  keep_running = false
}


module "backend_servers" {
  source = "./modules/container"

  for_each = {
    for idx, server in var.backend_servers :
    idx => server
  }

  container_name = "backend-${each.key}"

  image_name   = each.value.image_name
  image_tag    = each.value.image_tag
  networks     = each.value.attached_networks
  dns_servers  = []
  keep_running = true
}