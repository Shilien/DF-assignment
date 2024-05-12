variable "resource_name" {
  description = "Api resource name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  default     = "eu-west-1"
  type        = string
}

variable "aws_ecr_account" {
  description = "AWS ECR account number"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "The id of the VPC"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "package_version" {
  description = "The version of the package that will be deployed"
  default     = "0.0.0"
  type        = string
}

variable "ecs_cloudwatch_log_group_name" {
  description = "Cloudwatch log group for ecs task"
  type        = string
}

variable "ecs_security_group" {
  description = "The security group of the ECS Service"
}

variable "ecs_subnet_ids" {
  description = "The subnetes where the container is spowned"
}

variable "ecs_task_access_policy" {
  description = "IAM policy for the ECS task"

}

variable "alb_apigateway_paths" {
  type        = map(any)
  description = "The routes defined in the ALB listener rules"
}

variable "alb_listener_arn" {
  type = string
}

variable "task_cpu" {
  type    = number
  default = 256
}

variable "task_memory" {
  type    = number
  default = 512
}

variable "task_instance_count" {
  type    = number
  default = 1
}

variable "ecs_extra_env_secrets" {
  type        = list(any)
  default     = []
  description = "List of environment secrets. https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html"
}

variable "ecs_extra_env_variables" {
  type        = list(any)
  default     = []
  description = "List of environment variables used in the ecs deployment."
}
