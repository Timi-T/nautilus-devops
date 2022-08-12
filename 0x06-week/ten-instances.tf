provider "aws" {
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_instance" "one-instance" {
    count = 0
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    tags = {
        Name = "one-instance"
    }
}
