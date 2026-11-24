# Drupal Disaster Recovery and Backup Plan

## 1. Objectives

This plan describes how to recover the Drupal environment following application server, database, storage, or availability-zone failures.

## 2. Application Server Recovery

- The application runs on two EC2 instances across separate Availability Zones.
- The Application Load Balancer distributes traffic between registered healthy targets.
- If an application server fails, investigate its health and restore or replace it.
- Use Terraform to reproduce infrastructure where appropriate.
- Use Ansible to restore the required server configuration.

## 3. Database Recovery

- The application uses Amazon RDS for MySQL.
- RDS automated backups are configured with a one-day retention period.
- Restore the database from an available backup or snapshot when recovery is necessary.
- Update application database configuration if the restored database endpoint changes.

## 4. Shared File Storage

- Amazon EFS provides shared storage for Drupal public files.
- Verify EFS mount targets and connectivity from both application servers during recovery.
- Restore files from an available backup if data loss occurs.

## 5. Infrastructure Recovery

- Terraform configuration defines the infrastructure.
- Keep Terraform state securely stored and backed up.
- Review resource dependencies before applying infrastructure changes.
- Use Ansible to configure recovered application servers.

## 6. Recovery Validation

After recovery:
1. Confirm both application servers are operational.
2. Confirm the load balancer reports healthy targets.
3. Confirm database connectivity.
4. Confirm shared Drupal files are accessible.
5. Check CloudWatch alarms and application logs.
6. Confirm that the Drupal website responds correctly.

## 7. Future Improvements

- Increase database backup retention according to business requirements.
- Configure and test EFS backups.
- Define formal Recovery Time Objective (RTO) and Recovery Point Objective (RPO).
- Conduct periodic disaster recovery exercises.
