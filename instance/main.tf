provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region="us-east-1"
}

resource "aws_security_group" "ssh_connection" {
  name = var.security_group_name

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}

resource "aws_instance" "platzi-instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
  security_groups = [aws_security_group.ssh_connection.name]
}