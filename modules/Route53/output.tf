#Route53 record name
output "route53_record_name" {
  value = aws_route53_record.cdn_dns.name
  description = "The DNS name."
}
