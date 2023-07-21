
##Variables for CloudFront

variable "http_version" {
  description = "The maximum HTTP version to support on the distribution. Allowed values are http1.1 and http2."
  type        = string
}

 variable "alias" {
   description = "Extra CNAMEs (alternate domain names), if any, for this distribution."
   type        = list
 }

variable "enabled" {
  default     = "true"
  description = "Whether the distribution is enabled to accept end user requests for content."
  type        = string
}

variable "price_class" {
  default     = "PriceClass_All"
  description = "The price class for this distribution."
  type        = string
}

variable "comment" {
  type        = string
  description = "Any comments you want to include about the distribution."
}

variable "is_ipv6_enabled" {
  default     = "true"
  description = "Whether the IPv6 is enabled for the distribution."
  type        = string
}

variable "default_root_object" {
  default     = "index.html"
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type        = string
}

variable "origin_access_identity_comment" {
  description = "comment for the origin access identity."
  type        = string
}

##CDN Logging settings variables

variable "log_include_cookies" {
  default     = "false"
  description = "Specifies whether you want CloudFront to include cookies in access logs"
  type        = string
}
variable "log_bucket" {
  description = "S3 bucket to store the access logs in."
  type        = string
}
variable "log_prefix" {
  description = "An optional string that you want CloudFront to prefix to the access log filenames for this distribution"
  type        = string
}


##CDN SSL certificates variables
variable "viewer_minimum_protocol_version" {
  default     = "TLSv1.2_2021"
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections."
  type        = string
}

variable "cloudfront_default_certificate" {
  default     = "false"
  description = "Mark it as true if CloudFront certificate to be used."
  type        = string
}

variable "ssl_support_method" {
  default     = "acm_certificate_arn"
  description = "Specifies how you want CloudFront to serve HTTPS requests"
  type        = string
}


##CDN Behavior variables

variable "allowed_methods" {
  type        = list
  default     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin"
}

variable "cached_methods" {
  type        = list
  default     = ["GET", "HEAD"]
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods."
}

variable "query_string" {
  default     = "false"
  description = "Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior."
  type        = string
}

variable "forward_cookies" {
  default     = "none"
  description = "Specifies whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior."
  type        = string
}

variable "viewer_protocol_policy" {
  default     = "redirect-to-https"
  description = "specify the protocol that users can use to access the files in the origin."
  type        = string
}

variable "min_ttl" {
  default     = "0"
  description = "The minimum amount of time that you want objects to stay in CloudFront caches."
  type        = number
}

variable "default_ttl" {
  default     = "0"
  description = "TThe default amount of time (in seconds) that an object is in a CloudFront cache."
  type        = number
}

variable "max_ttl" {
  default     = "0"
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache."
  type        = number
}

#CDN Geo Restriction variables
variable "geo_restriction_type" {
  default     = "none"
  description = "The method that you want to use to restrict distribution of your content by country."
  type        = string
}

variable "acm_certificate_arn" {
  type = string
}

##Vaiables for Route53
variable hosted_zone_id {
  description = "Hosted Zone ID where the record shall be created."
  type        = string
}

variable route53_record_name {
  description = "Record name to be created under hosted zone"
  type        = string
  
}

variable domain_name {
  description = "domain name"
  type =string
}

##Variables for ACM cert generation
# variable acm_domain_name_prefix {
#   description = "Domain name prefix to generate ACM certificate"
#   default     = "ktdashboard"
#   type        = string
# }

##Vaiables for static content S3 bucket
variable "bucket_name" {
  description = "The bucket name we are creating."
  type        = string
}

#variable "region" {
#  description = "The region where bucket is created."
#  type        = string
#}

variable "acl" {
  description = "The canned ACL to apply."
  type        = string
}

##Values for tags
variable "costcenter" {
  description = "Cost Center tag for billing."
  type        = string
}

variable "environment" {
  description = "A name to describe the environment we're creating."
  type        = string
}

variable "service" {
  description = "Service name for which S3 bucket is being created."
  type        = string
}

variable "TFRepo" {
  description = "Terraform Repository path where the TF code is located."
  type        = string
}

variable "Owner" {
  description = "Owner of the Service."
  type        = string
}

variable "TechnicalOwner" {
  description = "Technical Owner of the Service."
  type        = string
}

