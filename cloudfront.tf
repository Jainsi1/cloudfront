
module "S3"{
    depends_on = [module.Cloudfront.origin_access_identity]
    source          = "./modules/S3"
    bucket_name     = "${var.bucket_name}-${var.environment}"
    acl           = var.acl
    origin_access_identity    = module.Cloudfront.origin_access_identity
    costcenter      = var.costcenter
    environment     = var.environment
    service         = var.service
    TFRepo          = var.TFRepo
    Owner           = var.Owner
    TechnicalOwner  = var.TechnicalOwner
}

# module "acm" {
#   source                    = "../modules/Acm"
#   #acm_domain_name_prefix    = "${var.acm_domain_name_prefix}-${var.environment}"
#   costcenter                = var.costcenter
#   environment               = var.environment
#   service                   = var.service
#   TFRepo                    = var.TFRepo
#   Owner                     = var.Owner
#   TechnicalOwner            = var.TechnicalOwner
# }

module"Cloudfront"{
   source                          = "./modules/Cloudfront"
   enabled                          = var.enabled
   comment                          = var.comment
   cdn_bucket_domain_name           = module.S3.cdn_bucket_domain_name
   alias                            = var.alias
   price_class                      = var.price_class
   is_ipv6_enabled                  = var.is_ipv6_enabled
   default_root_object              = var.default_root_object
   log_include_cookies              = var.log_include_cookies
   http_version                     = var.http_version
   log_bucket                       = "${var.log_bucket}-${var.environment}"
   log_prefix                       = var.log_prefix
   acm_certificate_arn              = var.acm_certificate_arn
   viewer_minimum_protocol_version  = var.viewer_minimum_protocol_version
   cloudfront_default_certificate   = var.cloudfront_default_certificate
   ssl_support_method               = var.ssl_support_method
   allowed_methods                  = var.allowed_methods
   cached_methods                   = var.cached_methods
   viewer_protocol_policy           = var.viewer_protocol_policy
   default_ttl                      = var.default_ttl
   min_ttl                          = var.min_ttl
   max_ttl                          = var.max_ttl
   query_string                     = var.query_string
   forward_cookies                  = var.forward_cookies
   geo_restriction_type             = var.geo_restriction_type
   origin_access_identity_comment   = var.origin_access_identity_comment
   costcenter                       = var.costcenter
   environment                      = var.environment
   service                          = var.service
   TFRepo                           = var.TFRepo
   Owner                            = var.Owner
   TechnicalOwner                   = var.TechnicalOwner
}

module "R53"{
    source = "./modules/Route53"
    hosted_zone_id = var.hosted_zone_id
    route53_record_name = var.route53_record_name
    domain_name = var.domain_name
    cloudfront_domain = module.Cloudfront.cloudfront_distribution_domain
    cloudfront_zone = module.Cloudfront.cloudfront_distribution_zone_id
}
