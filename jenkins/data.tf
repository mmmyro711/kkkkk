# shared tools vpc
data "aws_vpc" "shared_tools_vpc" {
  filter {
    name   = "tag:Name"
    values = ["shared-tools-vpc"]
  }
}

# public subnet1
data "aws_subnet" "pub_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["shared-tools-pub-subnet1"]
  }
}

# route53 - hosted zone
data "aws_route53_zone" "kloudgate_hosted_zone" {
  name = var.hosted_zone_name
}

# script 
data "template_file" "user_data" {
  template = file("scripts/configure_jenkins.yml")
}