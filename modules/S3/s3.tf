# create an S3 bucket to store the FE code in
resource "aws_s3_bucket" "cdn_bucket" {
  bucket = var.bucket_name
  acl = var.acl
  versioning {
    enabled = true
  }
  
  tags = {
    Name            = var.bucket_name
    CostCenter      = var.costcenter
    Environment     = var.environment
    Service         = var.service
    TFRepo          = var.TFRepo
    Owner           = var.Owner
    TechnicalOwner  = var.TechnicalOwner
  }
}
##Block public access to S3 bucket
resource "aws_s3_bucket_public_access_block" "for_cdn_bucket" {
  bucket = aws_s3_bucket.cdn_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

##Creating IAM policy
data "aws_iam_policy_document" "s3_policy" {
  policy_id = "PolicyForCloudFrontPrivateContent"
  statement {
    sid       = "RoleForS3"
    actions   = ["s3:GetObject"]
    resources = [
      aws_s3_bucket.cdn_bucket.arn,
      "${aws_s3_bucket.cdn_bucket.arn}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = [var.origin_access_identity]
    }
  }
}

##Attach the policy to S3 bucket
resource "aws_s3_bucket_policy" "bucket" {
  bucket = aws_s3_bucket.cdn_bucket.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

