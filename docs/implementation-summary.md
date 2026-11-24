# Drupal DevOps Implementation Summary

## Project Objective

Design and implement a highly available Drupal hosting environment on AWS using Infrastructure as Code, configuration management, containerization, CI/CD, and monitoring.

## Infrastructure Implemented

- AWS VPC spanning two Availability Zones.
- Two EC2 Drupal application servers.
- Application Load Balancer.
- Amazon RDS MySQL database.
- Amazon EFS shared storage.
- Security groups separating application and database access.
- CloudWatch alarms and SNS email notifications.

## Automation Implemented

- Terraform infrastructure configuration.
- Ansible inventory, reusable roles, and playbooks.
- Docker application build configuration.
- GitHub Actions CI/CD workflow.
- GitHub OIDC authentication for AWS deployments.
- AWS Systems Manager for remote deployment.

## Monitoring and Recovery

- CloudWatch infrastructure alarms.
- SNS notifications.
- Prometheus and Grafana configuration.
- Documented disaster recovery procedures.
- RDS automated backup configuration.

## Deployment Approach

The infrastructure is provisioned through Terraform. Ansible configures the application servers. GitHub Actions builds and publishes the container image and deploys to the staging environment through AWS Systems Manager.

## Outstanding Validation

The following activities remain for the final verification phase:

1. Validate the complete Drupal installation and database schema.
2. Verify both application servers serve the application correctly.
3. Confirm EFS mounts and shared file access on both servers.
4. Validate Prometheus and Grafana connectivity.
5. Verify the CI/CD workflow from build through deployment.
6. Perform backup restoration and disaster recovery exercises.
7. Capture genuine AWS Console screenshots for submission.

## Conclusion

The project establishes the core AWS infrastructure and automation foundation for a multi-AZ Drupal deployment. Final validation and evidence collection will confirm the operational readiness of the environment.
