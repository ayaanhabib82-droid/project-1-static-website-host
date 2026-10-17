output "website_url" {
  description = "Public website endpoint. Use HTTPS when an ACM certificate was configured."
  value       = "${var.acm_certificate_arn == "" ? "http" : "https"}://${aws_lb.web.dns_name}"
}

output "custom_domain_url" {
  description = "Optional Route 53 website address."
  value       = var.domain_name == "" ? null : "${var.acm_certificate_arn == "" ? "http" : "https"}://${var.domain_name}"
}

output "database_endpoint" {
  description = "Private RDS endpoint. It is not reachable directly from the public internet."
  value       = aws_db_instance.main.address
}
