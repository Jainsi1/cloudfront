
##This resource will create Static Cloudfront Distribution
resource "aws_cloudfront_distribution" "static_distribution" {
  depends_on = [
    aws_s3_bucket.cdn_log_bucket
  ]
  enabled             = var.enabled
  aliases             = var.alias
  comment             = format("%s static content", var.comment)
  price_class         = var.price_class
  is_ipv6_enabled     = var.is_ipv6_enabled
  default_root_object = var.default_root_object
  http_version        = var.http_version

  ##CDN Logging settings
  logging_config {
    include_cookies = var.log_include_cookies
    bucket          = format("%s.s3.amazonaws.com", var.log_bucket)
    prefix          = format("%sstatic/", var.log_prefix)
  }

  ##CDN SSL certificates
  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    minimum_protocol_version       = var.viewer_minimum_protocol_version
    cloudfront_default_certificate = var.cloudfront_default_certificate
    ssl_support_method             = var.ssl_support_method
  }

  ##CDN S3 Origin
  origin {
    origin_id   = "S3Bucket"
    domain_name = var.cdn_bucket_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  ##CDN Behavior
  default_cache_behavior {
    allowed_methods        = var.allowed_methods
    cached_methods         = var.cached_methods
    target_origin_id       = "S3Bucket"
    viewer_protocol_policy = var.viewer_protocol_policy

    default_ttl = var.default_ttl
    min_ttl     = var.min_ttl
    max_ttl     = var.max_ttl
    compress    = true

    forwarded_values {
      query_string = var.query_string
      cookies {
        forward = var.forward_cookies
      }
    }
    /*lambda_function_association {
      event_type = "origin-response"
      lambda_arn = "${var.lambda_arn}" ##Ref lambda ARN
    }*/
  }

  ##CDN Custom error
  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 404
    response_code         = 200
    response_page_path    = "/error.html"
  }

  ##CDN Geo Restriction, currently set to none in variable
  restrictions {
    geo_restriction {
      restriction_type = var.geo_restriction_type
    }
  }

  ##CDN Tags
  tags = {
    Name           = format("%s static content", var.comment)
    CostCenter     = var.costcenter
    Environment    = var.environment
    Service        = var.service
    TFRepo         = var.TFRepo
    Owner          = var.Owner
    TechnicalOwner = var.TechnicalOwner
  }
}

##This resource will create Static Cloudfront Origin Access Identity
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = var.origin_access_identity_comment
}

##This resource will create S3 bucket for CloudFront logging
resource "aws_s3_bucket" "cdn_log_bucket" {
  bucket = var.log_bucket
  #acl    = "log-delivery-write"
  
  tags = {
    Name           = var.log_bucket
    CostCenter     = var.costcenter
    Environment    = var.environment
    Service        = var.service
    TFRepo         = var.TFRepo
    Owner          = var.Owner
    TechnicalOwner = var.TechnicalOwner

  }
}
resource "aws_s3_bucket_ownership_controls" "cdn_log_bucket" {
  bucket = aws_s3_bucket.cdn_log_bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }
}
