variable "ami" {
  description = "Latest Amazon Linux 2 AMI ID"
  type        = string
  sensitive   = true
}

variable "keypair" {
  description = "Remote Access Keypair"
  type        = string
  sensitive   = true
}

variable "availability_zone" {
  description = "Seoul AZ List"
  type        = list(string)
}

variable "default_route" {
  description = "Default Routing CIDR Prefix"
  type        = string
}

variable "vpc_cidr" {
  description = "Main VPC CIDR Prefix"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "Main VPC's Public Subnet 1 CIDR "
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "Main VPC's Public Subnet 2 CIDR "
  type        = string
}