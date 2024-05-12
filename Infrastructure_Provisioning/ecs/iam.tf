resource "aws_iam_role" "default" {
  name = "${var.resource_name}-role"

  tags = var.tags

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = [
            "ecs-tasks.amazonaws.com"
          ]
        },
      },
    ]
  })
}

resource "aws_iam_policy" "default_access_policy" {
  name        = "${var.resource_name}-policy"
  description = "A policy allowing ${var.resource_name} to write logs"
  policy      = var.ecs_task_access_policy
}

resource "aws_iam_role_policy_attachment" "default_access_policy_attachment" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default_access_policy.arn
}
