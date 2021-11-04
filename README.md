# terraform-aws-ecs-service

Only supports EC2 instance based ECS cluster.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.60 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.63.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [random_id.ecs_service](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_id.ecs_task_definition](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_id.target_group](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | ID of the ECS cluster to deploy the service. | `string` | n/a | yes |
| <a name="input_container_definitions"></a> [container\_definitions](#input\_container\_definitions) | Mapping of ECS container definitions. | `any` | n/a | yes |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | Name of the container specified in task definition. | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Container port to receive the traffic. | `number` | n/a | yes |
| <a name="input_deploy_service"></a> [deploy\_service](#input\_deploy\_service) | Deploy ECS service. | `bool` | `true` | no |
| <a name="input_deploy_target_group"></a> [deploy\_target\_group](#input\_deploy\_target\_group) | Deploy target group. | `bool` | `true` | no |
| <a name="input_deploy_task_definition"></a> [deploy\_task\_definition](#input\_deploy\_task\_definition) | Deploy ECS task definition. | `bool` | `true` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Number of task to run. | `number` | `1` | no |
| <a name="input_ecs_service_token"></a> [ecs\_service\_token](#input\_ecs\_service\_token) | Token for unique name generation. | `string` | `"ecs_service"` | no |
| <a name="input_enable_execute_command"></a> [enable\_execute\_command](#input\_enable\_execute\_command) | Enable execute command on the ECS service. | `bool` | `false` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | ARN of the task execution role that the ECS container agent and DOcker daemon can assume. | `string` | `null` | no |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Health check for the default target group deployed. | `any` | `null` | no |
| <a name="input_host_port"></a> [host\_port](#input\_host\_port) | Port to receive traffic on the EC2 instance. | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Purpose of the ECS service. | `string` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol for the ECS service. | `string` | `"HTTP"` | no |
| <a name="input_service_alb_config"></a> [service\_alb\_config](#input\_service\_alb\_config) | ECS service ALB config. | `any` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to applicable resources. | `map(string)` | `{}` | no |
| <a name="input_target_group_token"></a> [target\_group\_token](#input\_target\_group\_token) | Token for unique name generation. | `string` | `"target_group"` | no |
| <a name="input_task_definition_token"></a> [task\_definition\_token](#input\_task\_definition\_token) | Token for unique name generation. | `string` | `"task_definition"` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services. | `string` | `null` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | List of volume configuration | `any` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC to deploy the service. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_alb_target_group"></a> [aws\_alb\_target\_group](#output\_aws\_alb\_target\_group) | Outputs of the ALB target group created. |
| <a name="output_aws_ecs_service"></a> [aws\_ecs\_service](#output\_aws\_ecs\_service) | Outputs of the ECS service created. |
| <a name="output_aws_ecs_task_definition"></a> [aws\_ecs\_task\_definition](#output\_aws\_ecs\_task\_definition) | Outputs of the ECS task definition created. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
