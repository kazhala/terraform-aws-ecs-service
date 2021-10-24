output "aws_alb_target_group" {
  description = "Outputs of the ALB target group created."

  value = {
    this = var.deploy_target_group ? aws_alb_target_group.this[0] : null
  }
}

output "aws_ecs_task_definition" {
  description = "Outputs of the ECS task definition created."

  value = {
    this = var.deploy_task_definition ? aws_ecs_task_definition.this[0] : null
  }
}

output "aws_ecs_service" {
  description = "Outputs of the ECS service created."

  value = {
    this = var.deploy_service ? aws_ecs_service.this[0] : null
  }
}
