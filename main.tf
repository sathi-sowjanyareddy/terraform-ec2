terraform {
  backend "s3" {
   bucket  = "terraform-state-tripura"
   key     = "ec2/terraform.tfstate"
   region  = "ap-south-1"
   dynamodb_table = "terraform-locks"
  }
}

resource "aws_security_group" "my_sg" {
  name = "allow_ssh_http"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



provider "aws" {
  region = var.region
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  user_data_replace_on_change = true

  user_data = <<-EOF
               #!/bin/bash
               sudo yum update -y
               sudo yum install nginx -y
               sudo systemctl start nginx
               sudo systemctl enable nginx
               EOF
  lifecycle {
    ignore_changes = [ami]
  }


  tags = {
    Name = "terraform-ec2"
  }
}

resource "aws_eip" "my_eip" {
  instance = aws_instance.my_ec2.id
}
