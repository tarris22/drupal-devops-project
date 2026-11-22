variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Project identifier"
  type        = string
  default     = "drupal-devops"
}

variable "vpc_cidr" {
  description = "CIDR block for the project VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "db_password" {
  description = "Master password for the Drupal RDS database"
  type        = string
  sensitive   = true
}
