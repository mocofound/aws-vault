provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ubuntu" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.medium"

  tags = {
    Name = "Vault Server 1"
    Owner = "Alex Harness"
    Billing = "Billing Account APPLEOSDevelopers"
  }
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

  owners = ["099720109477"] # Canonical
}
