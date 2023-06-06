variable "public_key" {
  description = "Public key used to authenticate with the Ubuntu instances"
}

variable "region" {
  description = "The region where the Ubuntu instances will be created"
  default     = "us-east-2"
}

variable "instance_type" {
  description = "The type of instance to create"
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI to use for the Ubuntu instances"
  default     = "ami-0dba2cb6798deb6d8" # Ubuntu 20.04 LTS
}