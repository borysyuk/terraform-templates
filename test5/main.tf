variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 8300
      external = 8300
      protocol = "tcp"
    }
  ]
}

variable "docker_ports2" {
  type = list(object({
    internal2 = number
    external2 = number
    protocol2 = string
  }))
  default = [
    {
      internal2 = 8300
      external2 = 8300
      protocol2 = "tcp"
    }
  ]
}

resource "null_resource" "check_ip" {
  triggers = {
    current_time = timestamp()
  }
  provisioner "local-exec" {
    command = "curl -s https://ifconfig.me/ip > ip.txt"
  }
}

data "local_file" "read_ip" {
  depends_on = [null_resource.check_ip]
  filename = "./ip.txt"
}

output "scalr_ip" {
  value = "Current instance IP is: ${data.local_file.read_ip.content}\nDocker ports information: ${jsonencode(var.docker_ports)}"
}
