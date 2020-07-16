output "load_balancer_arn" {
  value = aws_lb.mlflow.arn
}

output "load_balancer_target_group_id" {
  value = aws_lb_target_group.mlflow.id
}

output "load_balancer_zone_id" {
  value = aws_lb.mlflow.zone_id
}

output "load_balancer_dns_name" {
  value = aws_lb.mlflow.dns_name
}

output "ecs_execution_role_id" {
  value = aws_iam_role.ecs_execution.id
}

output "ecs_task_role_id" {
  value = aws_iam_role.ecs_task.id
}

output "artifact_bucket_id" {
  value = local.artifact_bucket_id
}
