variable "name" {
  description = "Purpose of the ECS service."
  type        = string
}

variable "deploy_target_group" {
  description = "Deploy target group."
  type        = bool
  default     = true
}

variable "deploy_task_definition" {
  description = "Deploy ECS task definition."
  type        = bool
  default     = true
}

variable "deploy_service" {
  description = "Deploy ECS service."
  type        = bool
  default     = true
}

variable "host_port" {
  description = "Port to receive traffic on the EC2 instance."
  type        = number
}

variable "vpc_id" {
  description = "VPC to deploy the service."
  type        = string
}

variable "protocol" {
  description = "Protocol for the ECS service."
  type        = string
  default     = "HTTP"
}

variable "container_definitions" {
  description = "Mapping of ECS container definitions."
  type        = any
}

variable "volumes" {
  description = "List of volume configuration"
  type        = any
  default     = []
}

variable "cluster_id" {
  description = "ID of the ECS cluster to deploy the service."
  type        = string
}

variable "container_name" {
  description = "Name of the container specified in task definition."
  type        = string
}

variable "container_port" {
  description = "Container port to receive the traffic."
  type        = number
}

variable "desired_count" {
  description = "Number of task to run."
  type        = number
  default     = 1
}

variable "service_alb_config" {
  description = "ECS service ALB config."
  type        = any
  default     = []
}

# tfsec:ignore:GEN001
variable "task_definition_token" {
  description = "Token for unique name generation."
  type        = string
  default     = "task_definition"
}

# tfsec:ignore:GEN001
variable "target_group_token" {
  description = "Token for unique name generation."
  type        = string
  default     = "target_group"
}

# tfsec:ignore:GEN001
variable "ecs_service_token" {
  description = "Token for unique name generation."
  type        = string
  default     = "ecs_service"
}

variable "tags" {
  description = "Tags to apply to applicable resources."
  type        = map(string)
  default     = {}
}
