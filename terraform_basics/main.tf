resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.bucket_name
    acl    = "private"
}

resource "aws_instance" "ec2_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = "MyEC2Instance"
    }
    
}