# Find the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# IAM role for Systems Manager access
resource "aws_iam_role" "ec2_ssm" {
  name = "${var.project_name}-ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "ec2.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })
}

# Attach AWS managed SSM permissions
resource "aws_iam_role_policy_attachment" "ssm" {
  role = aws_iam_role.ec2_ssm.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Instance profile
resource "aws_iam_instance_profile" "ec2_ssm" {
  name = "${var.project_name}-ec2-ssm-profile"
  role = aws_iam_role.ec2_ssm.name
}

# Two Drupal application servers
resource "aws_instance" "drupal_app" {
  count = 2

  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public[count.index].id

  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.app.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2_ssm.name

  user_data = <<-EOF
    #!/bin/bash
    set -eux

    dnf install -y httpd amazon-ssm-agent

    systemctl enable --now httpd
    systemctl enable --now amazon-ssm-agent

    echo "Drupal DevOps Application Server $(hostname)" > /var/www/html/index.html
  EOF

  user_data_replace_on_change = true

  root_block_device {
    volume_size           = 12
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "${var.project_name}-app-${count.index + 1}"
    Role = "Drupal-Application"
  }
}

# Register both servers with the ALB target group
resource "aws_lb_target_group_attachment" "drupal" {
  count = 2

  target_group_arn = aws_lb_target_group.drupal.arn
  target_id        = aws_instance.drupal_app[count.index].id
  port             = 80
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role_policy" "read_db_password" {
  name = "${var.project_name}-read-db-password"
  role = aws_iam_role.ec2_ssm.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"
      Action = [
        "ssm:GetParameter"
      ]
      Resource = "arn:aws:ssm:${var.aws_region}:${data.aws_caller_identity.current.account_id}:parameter/drupal-devops/db/password"
    }]
  })
}
