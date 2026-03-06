internal_network_names = ["test_internal_network"]
external_network_name = "test_external_network"
web_server_name_template = "test_webserver"
web_servers = [ 
  {
    image_name = "nginx",
    image_tag  = "latest",
    dns_servers = [
      "8.8.8.8",
      "8.8.4.4"
    ],
    attached_networks = [
      "test_external_network",
      "test_internal_network"
    ]
  },
    {
    image_name = "nginx",
    image_tag  = "latest",
    dns_servers = [
        "1.1.1.1",
        "1.0.0.1"
    ],
    attached_networks = [
        "test_external_network",
        "test_internal_network"
    ]
    }
]
backend_servers = [ 
  {
    image_name = "ubuntu",
    image_tag  = "24.04",
    attached_networks = [
      "test_internal_network"
    ]
  },
  {
    image_name = "ubuntu",
    image_tag  = "22.04",
    attached_networks = [
      "test_internal_network"
    ]
  },
  {
    image_name = "ubuntu",
    image_tag  = "latest",
    attached_networks = [
      "test_internal_network"
    ]
  }
]