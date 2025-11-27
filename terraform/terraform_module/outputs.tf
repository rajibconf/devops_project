output "bucket_arns" {
  value = { for k, v in module.s3_buckets : k => v.bucket_arn }
}

output "bucket_ids" {
  value = { for k, v in module.s3_buckets : k => v.bucket_id }
}

output "bucket_names" {
  value = keys(module.s3_buckets)
}
