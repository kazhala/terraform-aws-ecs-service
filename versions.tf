terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.60"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 2.1.0"
    }
  }
}
