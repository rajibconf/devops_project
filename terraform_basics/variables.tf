variable "bucket_name" {
  type        = string
  description = "This is the name of S3 backet"
}

variable "region_name" {
    type  = string
    default = "ap-south-1"
    description = "This is the region name"
}
