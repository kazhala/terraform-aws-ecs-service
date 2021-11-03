locals {
  service_alb_config = var.deploy_target_group ? concat(var.service_alb_config, [{
    target_group_arn = aws_alb_target_group.this[0].arn
    container_name   = var.container_name
    container_port   = var.container_port
  }]) : var.service_alb_config
}

resource "random_id" "target_group" {
  byte_length = 4

  keepers = {
    token = var.target_group_token
  }
}

resource "aws_alb_target_group" "this" {
  count = var.deploy_target_group ? 1 : 0

  name = substr("${var.name}-${random_id.target_group.hex}", 0, 32)

  port        = var.host_port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = "instance"

  dynamic "health_check" {
    for_each = var.health_check == null ? [] : [var.health_check]

    content {
      enabled             = lookup(health_check.value, "enabled", null)
      healthy_threshold   = lookup(health_check.value, "healthy_threshold", null)
      interval            = lookup(health_check.value, "interval", null)
      matcher             = lookup(health_check.value, "matcher", null)
      path                = lookup(health_check.value, "path", null)
      port                = lookup(health_check.value, "port", null)
      protocol            = lookup(health_check.value, "protocol", null)
      timeout             = lookup(health_check.value, "timeout", null)
      unhealthy_threshold = lookup(health_check.value, "timeout", null)
    }
  }

  tags = merge({ Name = "${var.name}-ecs" }, var.tags)

  lifecycle {
    create_before_destroy = true
  }
}

resource "random_id" "ecs_task_definition" {
  byte_length = 4

  keepers = {
    token = var.task_definition_token
  }
}

resource "aws_ecs_task_definition" "this" {
  count = var.deploy_task_definition ? 1 : 0

  family       = "${var.name}-${random_id.ecs_task_definition.hex}"
  network_mode = "bridge"

  container_definitions = jsonencode(var.container_definitions)

  dynamic "volume" {
    for_each = var.volumes

    content {
      name = volume.value.name

      dynamic "efs_volume_configuration" {
        for_each = lookup(volume.value, "efs_volume_configuration", null) == null ? [] : [volume.value.efs_volume_configuration]

        content {
          file_system_id     = efs_volume_configuration.value.file_system_id
          transit_encryption = "ENABLED"
          root_directory     = lookup(efs_volume_configuration.value, "root_directory", null)
        }
      }
    }
  }

  tags = merge({ Name = var.name }, var.tags)

  lifecycle {
    create_before_destroy = true
  }
}

resource "random_id" "ecs_service" {
  byte_length = 4

  keepers = {
    token = var.ecs_service_token
  }
}

resource "aws_ecs_service" "this" {
  count = var.deploy_service ? 1 : 0

  name = "${var.name}-${random_id.ecs_service.hex}"

  cluster         = var.cluster_id
  task_definition = var.deploy_task_definition ? aws_ecs_task_definition.this[0].arn : null
  desired_count   = var.desired_count

  dynamic "load_balancer" {
    for_each = local.service_alb_config

    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }

  tags = merge({ Name = var.name }, var.tags)

  lifecycle {
    create_before_destroy = true
  }
}
