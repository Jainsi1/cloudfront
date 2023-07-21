##Vaiables for static content S3 bucket
variable "bucket_name" {
  description = "The bucket name we are creating."
  type        = string
}

# variable "region" {
#  description = "The region where bucket is created."
#  type        = string
# }

variable "acl" {
  description = "The canned ACL to apply."
 type        = string
}

##Dependancy for S3
variable origin_access_identity {
  description = "Domain name associated with record set"
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
