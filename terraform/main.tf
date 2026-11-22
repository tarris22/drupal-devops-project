data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  availability_zones = slice(
    data.aws_availability_zones.available.names,
    0,
    2
  )
}

# Main VPC
resource "aws_vpc" "drupal_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.drupal_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Public subnets in two availability zones
resource "aws_subnet" "public" {
  count = 2

  vpc_id                  = aws_vpc.drupal_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index + 1)
  availability_zone       = local.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-${count.index + 1}"
    Tier = "Public"
  }
}

# Private database subnets
resource "aws_subnet" "database" {
  count = 2

  vpc_id            = aws_vpc.drupal_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + 11)
  availability_zone = local.availability_zones[count.index]

  tags = {
    Name = "${var.project_name}-database-${count.index + 1}"
    Tier = "Private"
  }
}

# Public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.drupal_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public" {
  count = 2

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Database subnet group for RDS
resource "aws_db_subnet_group" "database" {
  name = "${var.project_name}-db-subnet-group"

  subnet_ids = aws_subnet.database[*].id

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}
