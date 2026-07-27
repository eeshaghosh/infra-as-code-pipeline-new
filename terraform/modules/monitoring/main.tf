resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/demo-app"
  retention_in_days = 7

  tags = {
    Name = "ecs-demo-logs"
  }
}

resource "aws_cloudwatch_metric_alarm" "ecs_cpu_high" {
  alarm_name          = "ecs-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    ClusterName = "ecs-demo-cluster"
  }

  alarm_description = "Alarm when ECS CPU utilization exceeds 80%"
}