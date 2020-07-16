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


