# Drupal DevOps Project Architecture

## 1. Overview

This project provisions and configures a highly available Drupal application environment on AWS using Terraform, Ansible, Docker, and CI/CD automation.

## 2. AWS Infrastructure

- **Region:** eu-north-1 (Stockholm)
- **VPC:** 10.20.0.0/16
- **Availability Zones:** eu-north-1a and eu-north-1b
- **Application servers:** Two EC2 instances distributed across the availability zones.
- **Load balancer:** Application Load Balancer distributes incoming HTTP traffic.
- **Database:** Amazon RDS MySQL in private networking.
- **Shared storage:** Amazon EFS for Drupal public files.
- **Monitoring and alerts:** CloudWatch alarms and SNS notifications.

## 3. Application Architecture

Users access Drupal through the Application Load Balancer. The load balancer forwards requests to the Drupal application servers.

Both application servers connect to the RDS MySQL database. EFS provides shared storage for Drupal files.

## 4. Infrastructure Automation

Terraform provisions the AWS infrastructure, including networking, compute, database, storage, security groups, and load balancing.

Ansible playbooks configure the application servers, install required packages, configure Apache and PHP-FPM, and prepare Drupal directories and shared storage.

## 5. CI/CD

GitHub Actions provides the CI/CD workflow:

1. Retrieve application source code.
2. Build the Docker image.
3. Run application checks.
4. Publish the image to GitHub Container Registry.
5. Authenticate to AWS using GitHub OIDC.
6. Deploy to the isolated staging environment through AWS Systems Manager.

## 6. Monitoring

CloudWatch alarms and SNS provide AWS infrastructure alerts.

Prometheus and Grafana configuration files are included for application-server metrics and dashboards.

## 7. High Availability and Recovery

The application servers are distributed across two Availability Zones and placed behind an Application Load Balancer.

RDS automated backups and shared EFS storage support recovery planning. Disaster recovery procedures will be documented separately.

## 8. Security

- Application and database resources use separate security groups.
- The database is not intended to be publicly accessible.
- GitHub Actions uses OIDC authentication for AWS access.
- Application secrets are kept outside source control.
- AWS Systems Manager is used for managed server access.
