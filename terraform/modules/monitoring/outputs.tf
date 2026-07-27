output "log_group_name" {
  value = aws_cloudwatch_log_group.ecs_logs.name
}

output "cpu_alarm_name" {
  value = aws_cloudwatch_metric_alarm.ecs_cpu_high.alarm_name
}