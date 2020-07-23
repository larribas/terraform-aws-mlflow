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

output "cluster_id" {
  value = aws_ecs_cluster.mlflow.id
}

output "service_execution_role_id" {
  value = aws_iam_role.ecs_execution.id
}

output "service_task_role_id" {
  value = aws_iam_role.ecs_task.id
}

output "service_autoscaling_target_service_namespace" {
  value = aws_appautoscaling_target.mlflow.service_namespace
}

output "service_autoscaling_target_resource_id" {
  value = aws_appautoscaling_target.mlflow.resource_id
}

output "service_autoscaling_target_scalable_dimension" {
  value = aws_appautoscaling_target.mlflow.scalable_dimension
}

output "service_autoscaling_target_min_capacity" {
  value = aws_appautoscaling_target.mlflow.min_capacity
}

output "service_autoscaling_target_max_capacity" {
  value = aws_appautoscaling_target.mlflow.max_capacity
}

output "artifact_bucket_id" {
  value = local.artifact_bucket_id
}
