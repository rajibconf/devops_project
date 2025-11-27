module "s3_buckets" {
    source = "./s3"

    for_each = toset(var.bucket_names)
    bucket_name = each.value

    tags = var.tags
}
