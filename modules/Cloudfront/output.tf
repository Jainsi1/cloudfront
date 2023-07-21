##CloudFront Distribution ID
output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.static_distribution.id
  description = "The Cloudfront distribution ID."
}

##CloudFront Distribution domain name
output "cloudfront_distribution_domain" {
  value = aws_cloudfront_distribution.static_distribution.domain_name
  description = "The Cloudfront distribution domain name."
}

##CloudFront Distribution domain name
output "cloudfront_distribution_zone_id" {
  value = aws_cloudfront_distribution.static_distribution.hosted_zone_id
  description = "The Cloudfront distribution domain name."
}

##CDN Origin access identity
output "origin_access_identity" {
  value = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
  description = "OAI used in CloudFront"
}
