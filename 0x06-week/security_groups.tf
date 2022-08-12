# Security group for Load balancer

resource "aws_security_group" "autoscale_elb_sg" {
  name        = "autoscale_elb_sg"
  description = "Allow traffic from any address"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Traffic from anywhere"
    from_port        = 80
    to_port          = 80
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
    Name = "autoscale_elb_sg"
  }
}

# Security group for EC2 instances

resource "aws_security_group" "autoscale_instance_sg" {
  name        = "autoscale_instance_sg"
  description = "Contol traffic flow"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Traffic from anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups = [aws_security_group.autoscale_elb_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "autoscale_instance_sg"
  }
}

# Load balancer resource

resource "aws_elb" "autoscale-elb" {
  name = "autoscale-elb"
  subnets = var.autoscale_subnets
  security_groups = [aws_security_group.autoscale_elb_sg.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  #instances                   = [aws_instance.foo.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "autoscale_elb"
  }
}