variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}


variable "ami" {
  description  = "AMI ID for EC2"
  default      = "ami-0e670eb768a5fc3d4"
}

variable "key_name" {
  description  = "Key pair name"
  default      = "terraform-key"
}

variable "my_ip" {
  description  = "Your IP for SSH/HTTP access"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t3.micro"
}
