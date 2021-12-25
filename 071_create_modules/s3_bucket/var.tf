variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "sse_algorithm" {
  type        = string
  default     = "AES256"
  description = "SSE algorithm"

  validation {
    condition     = contains(["AES256", "aws:kms"], var.sse_algorithm)
    error_message = "The sse_algorithm must be AES256 or aws:kms."
  }
}

variable "kms_master_key_id" {
  type        = string
  default     = "aws/s3"
  description = "KMS master key ID"
}

variable "versioning" {
  type        = bool
  default     = true
  description = "Enabled versioning."
}

variable "vpc" {
  type        = string
  default     = ""
  description = "Allow access for particular VPC ID."
}

variable log_bucket {
  type        = string
  default     = null
  description = "Bucket for access logs."
}
