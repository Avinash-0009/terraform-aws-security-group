
variable "name" {
  description = "Name of the Security Group"
  type        = string
  default     = "app-security-group"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "ingress_cidr" {
  description = "Allowed source IPv4 CIDR for HTTP"
  type        = string
  default     = "0.0.0.0/0"
}

variable "egress_cidr" {
  description = "Allowed destination IPv4 CIDR"
  type        = string
  default     = "0.0.0.0/0"
}

