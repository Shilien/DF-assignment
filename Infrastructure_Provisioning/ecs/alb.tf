################################################################################
# SG of the ALB
################################################################################
module "alb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  create      = true
  name        = "${local.ecs_base_name}-alb-sg"
  description = "ECS ALB security group"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = var.ecs.alb_ingress_cidr_block
  ingress_rules       = ["http-80-tcp", "https-443-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

################################################################################
# ALB
################################################################################
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 7.0"

  create_lb = var.ecs.alb.create

  internal           = var.ecs.alb.internal
  name               = local.alb_name
  load_balancer_type = "application"
  vpc_id             = var.vpc_id
  security_groups    = [module.alb_sg.security_group_id]
  subnets            = var.private_subnets

  http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  https_listeners = [
    {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = var.certificate_arn
      action_type     = "fixed-response"

      fixed_response = {
        content_type = "text/plain"
        status_code  = "404"
      }
    }
  ]

  tags = var.tags
}

################################################################################
# ECS ALB target group definition.
# The rules give the access to the ecs loadbalancer.
################################################################################
resource "aws_lb_target_group" "default" {
  name        = "${var.resource_name}-target"
  port        = 80
  vpc_id      = var.vpc_id
  target_type = "ip"
  protocol    = "HTTP"

  tags = var.tags

  health_check {
    interval            = 30
    path                = "/_system/health"
    protocol            = "HTTP"
    timeout             = 15
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200-299"
  }
}

