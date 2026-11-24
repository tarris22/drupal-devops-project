# AWS Project Evidence Checklist

Capture screenshots directly from the AWS Management Console.

## 1. Networking
- [ ] VPC and CIDR configuration.
- [ ] Public and private subnets across two Availability Zones.
- [ ] Route tables and security groups.

## 2. Compute
- [ ] First Drupal EC2 instance and availability zone.
- [ ] Second Drupal EC2 instance and availability zone.
- [ ] Both instances running.

## 3. Load Balancing
- [ ] Application Load Balancer details.
- [ ] Target group configuration.
- [ ] Registered application instances and health status.

## 4. Database
- [ ] RDS MySQL instance details.
- [ ] Database availability and backup retention configuration.
- [ ] Database networking configuration.

## 5. Shared Storage
- [ ] EFS file system details.
- [ ] EFS mount targets across Availability Zones.

## 6. Monitoring
- [ ] CloudWatch alarms.
- [ ] SNS topic and confirmed email subscription.
- [ ] Prometheus and Grafana dashboards after deployment.

## 7. Automation
- [ ] GitHub Actions workflow execution.
- [ ] GitHub Container Registry image.
- [ ] Ansible playbook execution results.

## 8. Application
- [ ] Drupal application accessed through the load balancer.
- [ ] Drupal installation completed.
- [ ] Application responding successfully.

## Evidence Guidelines

- Use genuine AWS Console screenshots.
- Include resource names and relevant configuration details.
- Do not expose passwords, access keys, tokens, or private credentials.
- Save screenshots in this directory.
