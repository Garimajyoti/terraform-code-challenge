output "container_id" {
  value = docker_container.this.id
}

output "volume_name" {
  value = docker_volume.this.name
}