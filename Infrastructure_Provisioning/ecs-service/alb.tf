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

