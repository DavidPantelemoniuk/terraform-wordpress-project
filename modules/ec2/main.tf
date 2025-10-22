resource "aws_instance" "wordpress_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.sg_ids
  key_name               = var.key_name
  user_data              = file(var.user_data_file)

  tags = { Name = "wordpress-ec2" }
}
