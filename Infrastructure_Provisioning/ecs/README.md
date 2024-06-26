<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | terraform-aws-modules/alb/aws | ~> 7.0 |
| <a name="module_alb_sg"></a> [alb\_sg](#module\_alb\_sg) | terraform-aws-modules/security-group/aws | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.service_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.default_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.default_access_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb_target_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_listener_arn"></a> [alb\_listener\_arn](#input\_alb\_listener\_arn) | n/a | `string` | n/a | yes |
| <a name="input_alb_subnets"></a> [alb\_subnets](#input\_alb\_subnets) | The subnetes where the alb is created | `any` | n/a | yes |
| <a name="input_aws_ecr_account"></a> [aws\_ecr\_account](#input\_aws\_ecr\_account) | AWS ECR account number | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"eu-west-1"` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | The ACM certificate ARN. | `string` | n/a | yes |
| <a name="input_ecs_cloudwatch_log_group_name"></a> [ecs\_cloudwatch\_log\_group\_name](#input\_ecs\_cloudwatch\_log\_group\_name) | Cloudwatch log group for ecs task | `string` | n/a | yes |
| <a name="input_ecs_extra_env_secrets"></a> [ecs\_extra\_env\_secrets](#input\_ecs\_extra\_env\_secrets) | List of environment secrets. https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html | `list(any)` | `[]` | no |
| <a name="input_ecs_extra_env_variables"></a> [ecs\_extra\_env\_variables](#input\_ecs\_extra\_env\_variables) | List of environment variables used in the ecs deployment. | `list(any)` | `[]` | no |
| <a name="input_ecs_security_group"></a> [ecs\_security\_group](#input\_ecs\_security\_group) | The security group of the ECS Service | `any` | n/a | yes |
| <a name="input_ecs_subnet_ids"></a> [ecs\_subnet\_ids](#input\_ecs\_subnet\_ids) | The subnetes where the container is spowned | `any` | n/a | yes |
| <a name="input_ecs_task_access_policy"></a> [ecs\_task\_access\_policy](#input\_ecs\_task\_access\_policy) | IAM policy for the ECS task | `any` | n/a | yes |
| <a name="input_package_version"></a> [package\_version](#input\_package\_version) | The version of the package that will be deployed | `string` | `"0.0.0"` | no |
| <a name="input_resource_name"></a> [resource\_name](#input\_resource\_name) | Api resource name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | n/a | `number` | `256` | no |
| <a name="input_task_instance_count"></a> [task\_instance\_count](#input\_task\_instance\_count) | n/a | `number` | `1` | no |
| <a name="input_task_memory"></a> [task\_memory](#input\_task\_memory) | n/a | `number` | `512` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The id of the VPC | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->