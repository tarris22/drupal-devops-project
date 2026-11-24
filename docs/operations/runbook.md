# Drupal Operations Runbook

## 1. Routine Operations

- Monitor EC2 instance health and CloudWatch alarms.
- Review RDS availability and backup status.
- Monitor ALB target health.
- Check EFS availability and mount status.
- Review application and system logs.
- Keep application packages and dependencies updated.

## 2. Application Server Failure

1. Check the affected EC2 instance in AWS Console.
2. Review EC2 system and instance status checks.
3. Check the ALB target group's health status.
4. Review CloudWatch metrics and logs.
5. Restore or replace the failed instance if necessary.
6. Apply the required configuration using Ansible.
7. Confirm that the target is healthy before considering recovery complete.

## 3. Database Incident

1. Check the RDS instance status.
2. Review RDS events and CloudWatch metrics.
3. Check application-to-database connectivity.
4. Review available automated backups and snapshots.
5. Restore from a backup only when required and after assessing the recovery point.
6. Verify application connectivity after recovery.

## 4. Deployment Procedure

1. Review the source changes.
2. Confirm the GitHub Actions workflow configuration.
3. Build and publish the application image.
4. Deploy to staging through the CI/CD workflow.
5. Review deployment logs and application health.
6. Obtain the required approval before production deployment.

## 5. Monitoring Incident

1. Identify the triggered CloudWatch alarm.
2. Review the associated resource metrics.
3. Check SNS notifications.
4. Investigate the affected service.
5. Record the incident and corrective action.

## 6. Change Management

- Review infrastructure changes before applying Terraform.
- Protect Terraform state and backups.
- Avoid making untracked manual infrastructure changes.
- Document configuration changes.
- Keep deployment and recovery procedures updated.

## 7. Incident Records

For each incident, record:
- Date and time.
- Affected resource or service.
- Observed symptoms.
- Root cause, when identified.
- Recovery actions.
- Final outcome.
