# Drupal DevOps Security Documentation

## 1. Network Security

- AWS resources operate inside a dedicated VPC.
- Application servers are distributed across two Availability Zones.
- The Application Load Balancer receives external web traffic.
- The database uses a separate security group.
- Database access should be restricted to authorized application resources.

## 2. Identity and Access Management

- EC2 instances use IAM roles for AWS service access.
- AWS Systems Manager provides managed server access.
- GitHub Actions authenticates to AWS using OpenID Connect (OIDC).
- IAM permissions should follow the principle of least privilege.

## 3. Secrets Management

- Database passwords and application credentials must not be committed to Git.
- Sensitive values should be stored in AWS Systems Manager Parameter Store or another approved secrets manager.
- Terraform state files must be protected because they may contain sensitive values.
- GitHub deployment credentials should use short-lived OIDC credentials rather than permanent access keys.

## 4. Server Security

- Keep operating system packages and application dependencies updated.
- Restrict administrative access.
- Use appropriate file ownership and permissions.
- Avoid exposing database services directly to the public internet.

## 5. Container Security

- Use trusted container images.
- Avoid embedding passwords or tokens in Docker images.
- Keep runtime configuration separate from image contents.
- Review and update dependencies regularly.

## 6. Operational Security

- Monitor CloudWatch alarms and SNS notifications.
- Review IAM permissions and security group rules periodically.
- Protect deployment workflows and repository secrets.
- Validate backups and recovery procedures.
