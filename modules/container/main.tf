# Persistent volume
resource "docker_volume" "this" {
  name = "${var.container_name}-volume"
}

# Docker container
resource "docker_container" "this" {
  name  = var.container_name
  image = "${var.image_name}:${var.image_tag}"

  volumes {
    volume_name    = docker_volume.this.name
    container_path = "/data"
  }

  # DNS configuration (only applies to nginx)
  dns = var.dns_servers

  # Attach networks
  dynamic "networks_advanced" {
    for_each = var.networks
    content {
      name = networks_advanced.value
    }
  }

  # Keep Ubuntu containers running
  command = var.keep_running ? ["sleep", "infinity"] : null
}