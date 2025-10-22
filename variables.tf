variable "ingress_ports" {
  description = "List of ports to allow in wordpress-sg"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID"
  type        = string
  default     = "ami-0341d95f75f311023"
}
