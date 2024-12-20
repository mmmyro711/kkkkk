# EC2 Instance - Jenkins Server
resource "aws_instance" "jenkins" {
  ami                         = var.instance_ami
  instance_type               = var.instance_size
  subnet_id                   = data.aws_subnet.pub_subnet_1.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  key_name                    = var.ssh_key_name
  user_data                   = data.template_file.user_data.rendered
  root_block_device {
    delete_on_termination = true
    volume_size           = var.root_volume_size
    volume_type           = "gp2"
    encrypted             = true
  }
  tags = merge(local.common_tags,
    {
      Name = var.server_name
    }
  )
}