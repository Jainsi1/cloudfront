

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

variable cloudfront_zone {
  description = "Domain name associated with record set"
  type        = string
}

variable cloudfront_domain {
  description = "Domain name associated with record set"
  type        = string
}
