variable "container_name" {
  type = string
}

variable "image_name" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "networks" {
  type = list(string)
}

variable "dns_servers" {
  type    = list(string)
  default = []
}

variable "keep_running" {
  type    = bool
  default = false
}