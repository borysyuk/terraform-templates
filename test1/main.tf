resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo test"
  }
}

variable "image_id" {
  type = string
}

variable "password" {
  type = string
  sensitive = true
}

resource "dns_txt_record_set" "google" {
  zone = "example.com."
  txt = [
    "google-site-verification=...",
  ]
  ttl = 300
}

resource "dns_srv_record_set" "sip" {
  zone = "example.com."
  name = "_sip._tcp"
  srv {
    priority = 10
    weight   = 60
    target   = "bigbox.example.com."
    port     = 5060
  }
  srv {
    priority = 10
    weight   = 20
    target   = "smallbox1.example.com."
    port     = 5060
  }
  srv {
    priority = 10
    weight   = 20
    target   = "smallbox2.example.com."
    port     = 5060
  }
  ttl = 300
}

resource "dns_ptr_record" "dns-sd" {
  zone = "example.com."
  name = "r._dns-sd"
  ptr  = "example.com."
  ttl  = 300
}

resource "dns_a_record_set" "smtp" {
  zone = "example.com."
  name = "smtp"
  ttl  = 300

  addresses = [
    "192.0.2.1",
  ]
}

resource "dns_ns_record_set" "www3" {
  zone = "example.com."
  name = "www3"
  nameservers = [
    "a.iana-servers.net.",
    "b.iana-servers.net.",
  ]
  ttl = 300
}

resource "dns_aaaa_record_set" "www2" {
  zone = "example.com."
  name = "www2"
  addresses = [
    "fdd5:e282:43b8:5303:dead:beef:cafe:babe",
    "fdd5:e282:43b8:5303:cafe:babe:dead:beef",
  ]
  ttl = 300
}

resource "dns_cname_record" "foo" {
  zone  = "example.com."
  name  = "foo"
  cname = "bar.example.com."
  ttl   = 300
}

resource "dns_a_record_set" "www" {
  zone = "example.com."
  name = "www"
  addresses = [
    "192.168.0.1",
    "192.168.0.2",
    "192.168.0.3",
  ]
  ttl = 300
}

resource "time_offset" "example" {
  offset_days = 7
}

resource "time_rotating" "example2" {
  rotation_days = 30
}

resource "null_resource" "previous" {}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "30s"
}

resource "time_static" "example23" {}

resource "random_pet" "cat" {
}

resource "random_pet" "horse" {
  count = 23
}

resource "random_bytes" "jwt_secret" {
  length = 64
}

resource "random_id" "server" {
  byte_length = 8
}

resource "random_integer" "priority" {
  min = 1
  max = 50000
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_shuffle" "az" {
  input        = ["us-west-1a", "us-west-1c", "us-west-1d", "us-west-1e"]
  result_count = 2
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "random_uuid" "test" {
}

output "instance_ip_addr1" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}

output "instance_ip_addr2" {
  value       = "192.168.0.2"
  description = "The private IP2 address of the main server instance."
}
