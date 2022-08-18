provider "aws" {
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_key_pair" "nautilus_autoscale_key" {
    key_name = "nautilus_autoscale_key"
    public_key = file(var.key_pair)
}

# Security group for EC2 instances

resource "aws_security_group" "cicd_instance_sg" {
  name        = "cicd_instance_sg"
  description = "Contol traffic flow"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Traffic from anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  ingress {
    description      = "Traffic from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cicd_instance_sg"
  }
}

resource "aws_instance" "cicd-infra" {
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    key_name = aws_key_pair.nautilus_autoscale_key.key_name
    vpc_security_group_ids = [aws_security_group.cicd_instance_sg.id]
    tags = {
        Name = "cicd-infra"
    }
}
