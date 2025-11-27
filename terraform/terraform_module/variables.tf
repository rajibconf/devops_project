variable "region_name" {
  type        = string
  default     = "ap-south-1"
  description = "AWS Region to deploy resources"
}

variable "bucket_names" {
  type        = list(string)
  description = "List of S3 bucket names to create"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {
    Environment = "Development"
    Project     = "devops-lab"
  }
}