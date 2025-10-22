output "wordpress_sg_id" {
  value = aws_security_group.wordpress_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

output "key_name" {
  value = aws_key_pair.ssh_key.key_name
}
