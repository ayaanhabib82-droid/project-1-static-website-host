variable "project_name" {
  description = "Name used to identify resources belonging to this project."
  type        = string
  default     = "terraform-learning-web"
}

variable "aws_region" {
  description = "AWS region in which to create the infrastructure."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR range for the project VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "EC2 instance type for the web servers."
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "RDS instance class for the MySQL database."
  type        = string
  default     = "db.t3.micro"
}

variable "db_multi_az" {
  description = "Whether RDS should use a standby in another Availability Zone. Costs more."
  type        = bool
  default     = false
}

variable "db_name" {
  description = "Name of the initial MySQL database."
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Administrator username for the MySQL database."
  type        = string
  default     = "appadmin"
}

variable "db_password" {
  description = "Unique MySQL administrator password. Provide locally; never commit it."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.db_password) >= 16
    error_message = "The database password must be at least 16 characters long."
  }
}

variable "domain_name" {
  description = "Optional DNS name, such as app.example.com. Leave empty to skip Route 53."
  type        = string
  default     = ""
}

variable "route53_zone_id" {
  description = "ID of the existing Route 53 hosted zone for domain_name."
  type        = string
  default     = ""
}

variable "acm_certificate_arn" {
  description = "Optional ACM certificate ARN in this region; enables HTTPS and redirects HTTP."
  type        = string
  default     = ""
}
