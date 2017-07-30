variable "CLOUDOPS_VPC_CIDR" {
  default = "171.13.0.0/16"
}

variable "AWS_REGION" {
  default = "us-west-2"
}

variable "PUBLIC_SUBNET_1" {
  default = "171.13.1.0/24"
}

variable "PUBLIC_SUBNET_2" {
  default = "171.13.2.0/24"
}

variable "PRIVATE_SUBNET_1" {
  default = "171.13.3.0/24"
}

variable "NAT_AMI_ID" {
  default = "ami-030f4133"
}
variable "AVAILABILITY_ZONES"{
  type = "list"
  default = ["us-west-2a","us-west-2b","us-west-2c"]
}
