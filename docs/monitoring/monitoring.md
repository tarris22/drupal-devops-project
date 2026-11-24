# Drupal Infrastructure Monitoring

## 1. AWS CloudWatch

CloudWatch monitors infrastructure performance and availability.

Configured alarms include:
- Drupal application server 1 high CPU.
- Drupal application server 2 high CPU.
- RDS high CPU.
- Application Load Balancer unhealthy hosts.

## 2. SNS Notifications

The SNS topic `drupal-devops-alerts` distributes monitoring notifications to subscribed email addresses.

## 3. Prometheus

Prometheus configuration is provided under `monitoring/prometheus/`.

It is configured to collect:
- Prometheus server metrics.
- Drupal application server 1 metrics.
- Drupal application server 2 metrics.

## 4. Grafana

Grafana configuration is provided under `monitoring/grafana/`.

The infrastructure dashboard includes:
- CPU usage.
- Memory usage.
- Application server availability.

## 5. Monitoring Deployment

Prometheus and Grafana are defined in:

`monitoring/docker-compose.monitoring.yml`

Deployment and connectivity validation will be performed during the testing phase.
