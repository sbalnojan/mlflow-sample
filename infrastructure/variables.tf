variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "eu-central-1"
}

variable "aws_amis" {
  default = {
    "eu-central-1" = "ami-026d3b3672c6e7b66"
  }
}

variable "availability_zones" {
  default     = "eu-central-1b,eu-central-1c,eu-central-1a"
  description = "List of availability zones "
}

variable "subnet_id" {
  description = "your public subnet id"
}

variable "vpc_id" {
  description = "your public vpc id"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "AWS instance type"
}

variable "asg_min" {
  description = "Min numbers of servers in ASG"
  default     = "1"
}

variable "asg_max" {
  description = "Max numbers of servers in ASG"
  default     = "3"
}

variable "asg_desired" {
  description = "Desired numbers of servers in ASG"
  default     = "1"
}
