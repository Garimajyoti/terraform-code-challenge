variable "internal_network_names" {
  type = list(string)
}

variable "external_network_name" {
  type = string
}

variable "web_server_name_template" {
  type = string
}

variable "web_servers" {
  type = list(object({
    image_name        = string
    image_tag         = string
    dns_servers       = list(string)
    attached_networks = list(string)
  }))
}

variable "backend_servers" {
  type = list(object({
    image_name        = string
    image_tag         = string
    attached_networks = list(string)
  }))
}