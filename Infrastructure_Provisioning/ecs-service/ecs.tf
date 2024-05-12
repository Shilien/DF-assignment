################################################################################
# ECS Task and containter defintions including open telemtry collector sidecar
################################################################################
resource "aws_ecs_task_definition" "service_task_definition" {
  family                   = "${var.resource_name}-family"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  task_role_arn            = aws_iam_role.default.arn
  execution_role_arn       = aws_iam_role.default.arn
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  container_definitions = jsonencode([
    {
      name        = "${var.resource_name}-container"
      image       = "${var.aws_ecr_account}.dkr.ecr.eu-west-1.amazonaws.com/${var.resource_name}:${var.package_version}"
      links       = []
      essential   = true
      entryPoint  = []
      command     = []
      mountPoints = []
      volumesFrom = []
      portMappings = [{
        containerPort = 80,
        hostPort      = 80,
        protocol      = "tcp"
      }]
      ulimits = [{
        name      = "nofile",
        softLimit = 50000,
        hardLimit = 100000
      }]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.ecs_cloudwatch_log_group_name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = var.resource_name
        }
      },
      "environment" : concat([{
        "name" : "SERVICE_NAME",
        "value" : var.resource_name
        }
      ], var.ecs_extra_env_variables),
      "secrets" : var.ecs_extra_env_secrets
    }
  ])

  tags = merge(
    {
      Version = var.package_version
  }, var.tags)
}

resource "aws_ecs_service" "default" {
  name                               = var.resource_name
  cluster                            = var.ecs_cluster_id
  task_definition                    = aws_ecs_task_definition.service_task_definition.arn
  desired_count                      = var.task_instance_count
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = [var.ecs_security_group]
    subnets          = var.ecs_subnet_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.default.arn
    container_name   = "${var.resource_name}-container"
    container_port   = 80
  }

  tags = merge(
    {
      Version = var.package_version
  }, var.tags)
}
