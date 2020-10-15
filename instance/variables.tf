variable "access_key" {}
variable "secret_key" {}
variable "ami_id" {
  default=""
  description="Ami ID"
}
variable "instance_type" {}
variable "tags" {
  type=map
}

// Security group
variable "security_group_name" {}
variable "ingress_rules" {
  type=list
}