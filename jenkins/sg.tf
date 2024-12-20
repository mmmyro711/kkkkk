# Securit Group - Jenkins Server
resource "aws_security_group" "jenkins_sg" {
  name        = var.jenkins_sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.shared_tools_vpc.id
  tags = merge(local.common_tags,
    {
      Name = var.jenkins_sg_name
    }
  )
}

# Allow Outbound ALL
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.jenkins_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


# Allow Ingress HTTPS (443) from VPC CIDR
resource "aws_security_group_rule" "ingress_https" {
  security_group_id = aws_security_group.jenkins_sg.id
  type              = "ingress"
  protocol          = "tcp"
  cidr_blocks       = var.https_cidr_block
  from_port         = 443
  to_port           = 443
}


# Allow SSH (22)
resource "aws_security_group_rule" "ingress_ssh" {
  security_group_id = aws_security_group.jenkins_sg.id
  type              = "ingress"
  protocol          = "tcp"
  cidr_blocks       = var.ssh_cidr_block
  from_port         = 22
  to_port           = 22
}

# Allow HTTP (8080) - Jenkins UI
resource "aws_security_group_rule" "ingress_http" {
  security_group_id = aws_security_group.jenkins_sg.id
  type              = "ingress"
  protocol          = "tcp"
  cidr_blocks       = var.http_cidr_block
  from_port         = 8080
  to_port           = 8080
}

# Allow HTTP (80) - Certbot
resource "aws_security_group_rule" "ingress_http_80" {
  security_group_id = aws_security_group.jenkins_sg.id
  type              = "ingress"
  protocol          = "tcp"
  cidr_blocks       = var.certbot_cidr_block
  from_port         = 80
  to_port           = 80
}

    # Allow Ingress HTTPS (443) - github webhooks
resource "aws_security_group_rule" "ingress_https_443_webhook" {
  security_group_id = aws_security_group.jenkins_sg.id
  type              = "ingress"
  protocol          = "tcp"
  cidr_blocks       = var.webhooks_cidr_block
  from_port         = 443
  to_port           = 443
}
