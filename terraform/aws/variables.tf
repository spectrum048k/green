variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "ap-southeast-2"  
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "The bucket name must be between 3 and 63 characters long."
  }

  validation {
    condition     = can(regex("^[a-z0-9.-]+$", var.bucket_name))
    error_message = "The bucket name must only contain lowercase letters, numbers, dots (.), and hyphens (-)."
  }

  validation {
    condition     = !can(regex("^[0-9.]+$", var.bucket_name))
    error_message = "The bucket name cannot be composed solely of numbers and dots."
  }

  validation {
    condition     = !can(regex("--", var.bucket_name))
    error_message = "The bucket name cannot contain consecutive hyphens."
  }

  validation {
    condition     = !can(regex("-$", var.bucket_name))
    error_message = "The bucket name cannot end with a hyphen."
  }
}

variable "environment" {
  description = "The environment for the S3 bucket."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["sandbox", "dev", "fst", "qa", "prod"], var.environment)
    error_message = "The environment must be one of 'sandbox', 'dev', 'fst', 'qa', or 'prod'."
  }
}
