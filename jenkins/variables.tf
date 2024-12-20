# Server Variables
variable "server_name" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "instance_size" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

variable "root_volume_size" {
  type = string
}

# Security Group Variables
variable "jenkins_sg_name" {
  type = string
}

variable "ssh_cidr_block" {
  description = "SSH CIDR Block"
  type        = list(string)
}

variable "http_cidr_block" {
  description = "SSH CIDR Block"
  type        = list(string)
}

variable "certbot_cidr_block" {
  description = "SSH CIDR Block"
  type        = list(string)
}

# Route53 Variables
variable "hosted_zone_name" {
  description = "Route53 Hosted Zone Name"
  type        = string
}

variable "a_record_name" {
  description = "A Record Name"
  type        = string
}

variable "https_cidr_block" {
  description = "https"
  type  = list(string)
  
}

variable "webhooks_cidr_block" {
  description = "https"
  type  = list(string)
  
}