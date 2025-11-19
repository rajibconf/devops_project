output "bucket" {
    description = "The name of the S3 bucket"
    value = aws_s3_bucket.s3_bucket.bucket
}

output "ec2_instance_id" {
    description = "The ID of the EC2 instance"
    value       = aws_instance.ec2_instance.id
}

output "ec2_instance_public_ip" {
    description = "The public IP address of the EC2 instance"
    value       = aws_instance.ec2_instance.public_ip
}