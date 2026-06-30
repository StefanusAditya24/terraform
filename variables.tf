variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  description = "Ubuntu AMI ID for the selected AWS region"
  default     = "ami-06067086cf86c58e6"
}

variable "vpc_id" {
  description = "Existing VPC ID (get from AWS Academy console)"
  default     = ""
}

variable "public_subnet_ids" {
  description = "List of existing public subnet IDs (get from AWS Academy console)"
  type        = list(string)
  default     = []
}

variable "key_name" {
  default = "terraform-key"
}