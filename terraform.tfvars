##Values for Route53
hosted_zone_id                  = "Z01886073P2EU9PQLP46T"
route53_record_name             = "dev1"
domain_name                     = "manthanthakkar.works"

##Values for S3
bucket_name                     = "jainsiiii"
acl                             = "private"

##Values for CloudFront Distribution
http_version                    = "http2"
alias                           = ["dev1.manthanthakkar.works"]
enabled                         = true
price_class                     = "PriceClass_200"
comment                         = "dev1.manthanthakkar.works"
is_ipv6_enabled                 = true
default_root_object             = "index.html"
origin_access_identity_comment  = "CF Identity for dev1.manthanthakkar.works"
log_include_cookies             = false
log_bucket                      = "jainsi-logbucket"
log_prefix                      = "logs"
viewer_minimum_protocol_version = "TLSv1"
cloudfront_default_certificate  = false
acm_certificate_arn             = "arn:aws:acm:us-east-1:331313361307:certificate/ccf1257c-1226-4705-9cc7-2653054ae184"
ssl_support_method              = "sni-only"
allowed_methods                 = ["GET","HEAD","OPTIONS"]
cached_methods                  = ["GET","HEAD"]
query_string                    = false
forward_cookies                 = "none"
viewer_protocol_policy          = "redirect-to-https"
min_ttl                         = "0"
max_ttl                         = "0"
default_ttl                     = "0"
geo_restriction_type            = "none"

##Values for ACM
# acm_domain_name_prefix          = "synap"

#Variable declaration for tags
costcenter                      = "15250-10"
environment                     = "dev1"
service                         = "genai-frontend"
TFRepo                          = "https://github.com/bcg-kd-expe/genai-frontend"
Owner                           = "Neer heshtig"
TechnicalOwner                 = "David Lozzi"
