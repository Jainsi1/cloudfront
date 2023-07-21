##S3 bucket to store static content
output "cdn_bucket_name" {
  value = aws_s3_bucket.cdn_bucket.id
  description = "The S3 bucket to store static website contents."
}

output "cdn_bucket_arn" {
  value = aws_s3_bucket.cdn_bucket.arn
  description = "The S3 bucket ARN."
}

output "cdn_bucket_domain_name" {
  value = aws_s3_bucket.cdn_bucket.bucket_domain_name
  description = "The S3 bucket domain name."
}