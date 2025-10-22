output "wordpress_public_ip" {
  value = module.ec2.public_ip
}

output "wordpress_url" {
  value = "http://${module.ec2.public_ip}/blog"
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}
