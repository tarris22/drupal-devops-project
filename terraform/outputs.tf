output "vpc_id" {
  description = "Drupal VPC ID"
  value       = aws_vpc.drupal_vpc.id
}

output "availability_zones" {
  description = "Selected availability zones"
  value       = local.availability_zones
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "database_subnet_ids" {
  description = "Private database subnet IDs"
  value       = aws_subnet.database[*].id
}

output "database_subnet_group" {
  description = "RDS subnet group name"
  value       = aws_db_subnet_group.database.name
}

output "alb_security_group_id" {
  description = "Load balancer security group"
  value       = aws_security_group.alb.id
}

output "app_security_group_id" {
  description = "Drupal application security group"
  value       = aws_security_group.app.id
}

output "database_security_group_id" {
  description = "Database security group"
  value       = aws_security_group.database.id
}

output "database_endpoint" {
  description = "Private RDS database endpoint"
  value       = aws_db_instance.drupal.address
}

output "database_port" {
  description = "RDS database port"
  value       = aws_db_instance.drupal.port
}

output "database_name" {
  value = aws_db_instance.drupal.db_name
}

output "load_balancer_dns" {
  description = "Public DNS name of the Drupal load balancer"
  value       = aws_lb.drupal.dns_name
}

output "load_balancer_arn" {
  description = "ARN of the Drupal load balancer"
  value       = aws_lb.drupal.arn
}

output "target_group_arn" {
  description = "ARN of the Drupal target group"
  value       = aws_lb_target_group.drupal.arn
}

output "drupal_instance_ids" {
  description = "Drupal EC2 instance IDs"
  value       = aws_instance.drupal_app[*].id
}

output "drupal_private_ips" {
  description = "Private IP addresses of Drupal servers"
  value       = aws_instance.drupal_app[*].private_ip
}

output "drupal_availability_zones" {
  description = "Availability zones of Drupal servers"
  value       = aws_instance.drupal_app[*].availability_zone
}
