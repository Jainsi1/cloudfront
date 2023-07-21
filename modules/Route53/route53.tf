#This resource will create Route53 entry for CDN distribution
resource "aws_route53_record" "cdn_dns" {
    zone_id = var.hosted_zone_id
    name = "${var.route53_record_name}.${var.domain_name}"
    type = "A"
    alias {
        #name = module.CloudFront.cloudfront_distribution_domain
        name =   var.cloudfront_domain
        zone_id = var.cloudfront_zone
        evaluate_target_health = false
  }
}
