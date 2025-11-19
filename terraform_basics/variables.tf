variable "bucket_name" {
  type        = string
  description = "This is the name of S3 backet"
}

variable "region_name" {
    type  = string
    default = "ap-south-1"
    description = "This is the region name"
}

variable "ami_id" {
    type = string
    description = "The AMI ID for the EC2 instance"
}

variable "instance_type" {
    type = string
    description = "The instance type for the EC2 instance"
}

