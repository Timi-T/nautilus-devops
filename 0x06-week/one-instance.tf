provider "aws" {
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_instance" "one-instance" {
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    tags = {
        Name = "one-instance"
    }
}

variable "access_key" {
  description = "Access key for aws account"
  type        = string
  sensitive = true
}
variable "secret_key" {
  description = "Secret key for AWS account"
  type        = string
  sensitive = true
}

#resource "aws_vpc" "vpc1" {
#    cidr_block = "10.0.0.0/16"
#    tags = {
#        Name = "production"
#    }
#}

#resource "aws_subnet" "subnet1" {
#    vpc_id = aws_vpc.vpc1.id
#    cidr_block = "10.0.1.0/24"
#    tags = {
#      "Name" = "prod-subnet"
#    }
#}
