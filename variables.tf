variable "unique_name" {
  type        = string
  description = "A unique name for this application (e.g. mlflow-team-name)"
}

variable "tags" {
  type        = map(string)
  description = "AWS Tags common to all the resources created"
}

variable "vpc_id" {
  type        = string
  description = "AWS VPC to deploy MLFlow into"
}

variable "db_subnet_ids" {
  type        = list(string)
  description = "List of subnets where the RDS database will be deployed"
}

variable "mlflow_subnet_ids" {
  type        = list(string)
  description = "List of subnets where the MLFlow ECS service will be deployed (the recommendation is to use subnets that cannot be accessed directly from the Internet)"
}

variable "load_balancer_subnet_ids" {
  type        = list(string)
  description = "List of subnets where the Load Balancer will be deployed"
}

variable "load_balancer_ingress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks from where to allow traffic to the Load Balancer. With an internal LB, we've left this "
}

variable "container_image_tag" {
  type        = string
  default     = "1.9.1-beta"
  description = "The MLFlow version to deploy. Note that this version has to be available as a tag here: https://hub.docker.com/r/larribas/mlflow"
}

variable "cpu" {
  type        = number
  default     = 2048
  description = "The number of CPU units reserved for the MLFlow container"
}

variable "memory" {
  type        = number
  default     = 4096
  description = "The amount (in MiB) of memory reserved for the MLFlow container"
}

variable "internal_load_balancer" {
  type        = bool
  default     = true
  description = "By default, the load balancer is internal. This is because as of v1.9.1, MLFlow doesn't have native authentication or authorization. We recommend exposing MLFlow behind a VPN or using OIDC/Cognito together with the LB listener."
}

variable "log_retention_in_days" {
  type        = number
  default     = 90
  description = "The number of days to keep logs around"
}

variable "artifact_bucket_id" {
  type        = string
  default     = null
  description = "If specified, MLFlow will use this bucket to store artifacts. Otherwise, this module will create a dedicated bucket. When overriding this value, you need to enable the task role to access the root you specified"
}

variable "artifact_bucket_path" {
  type        = string
  default     = "/"
  description = "The path within the bucket where MLFlow will store its artifacts"
}

variable "database_password_secret_name" {
  type        = string
  description = "The name of the SecretManager secret that defines the database password. It needs to be created before calling the module"
}
