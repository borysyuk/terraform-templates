provider "aws" {
  region = "${var.region}"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}


resource "aws_instance" "terraform-test-instance" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"

  tags = {
    Name = "IhorBorysyukT-instance-000-new-version"
    timestamp = "${timestamp()}"
    test-env-owner = "i.borysyuk@scalr.com"
    owner = "i.borysyuk"
  }
  

  lifecycle {
    ignore_changes = ["tags"]
  }
}
