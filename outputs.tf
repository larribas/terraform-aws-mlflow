output "load_balancer_arn" {
  value = aws_lb.mlflow.arn
}

output "load_balancer_target_group_id" {
  value = aws_lb_target_group.mlflow.id
}
