variable "vpc_cidr_block" {
}

variable "vpc_public_subnet_cidr_block" {
}

variable "vpc_private_subnet_cidr_block"{
}

variable "vpc_database_subnet" {

}

variable "vpc_id"{}

variable "vpc_availability_zones"{}

variable "environment"{}

variable "vpc_name"{}

variable "aws_access_role" {
  description = "ARN of the AWS access role"
  type        = string
}