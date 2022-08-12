provider "aws" {
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

#resource "aws_ami" "ubuntu-t2" {
#  name = "ubuntu-t2"
#}
resource "aws_key_pair" "nautilus_autoscale_key" {
    key_name = "nautilus_autoscale_key"
    public_key = file(var.key_pair)
}

# Define AWS launch configuration
resource "aws_launch_configuration" "custom_launch_config" {
    name = "custom_launch_config"
    image_id = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    key_name = aws_key_pair.nautilus_autoscale_key.key_name
}

# Define auto-scaling group
resource "aws_autoscaling_group" "custom_autoscale_group" {
  name                      = "custom_autoscale_group"
  vpc_zone_identifier       = var.autoscale_subnets
  launch_configuration      = aws_launch_configuration.custom_launch_config.name
  max_size                  = 10
  min_size                  = 6
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 6
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "custom-ec2-instance"
    propagate_at_launch = true
  }
}

# Define autoscaling config policy
resource "aws_autoscaling_policy" "custom_cpu_policy" {
  name            = "custom_cpu_policy"
  autoscaling_group_name = aws_autoscaling_group.custom_autoscale_group.name
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = 1
  cooldown = 100
  policy_type = "SimpleScaling"
}

# Define cloud watch policy
resource "aws_cloudwatch_metric_alarm" "custum_cpu_alarm" {
  alarm_name          = "custom_cpu_alarm"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.custom_autoscale_group.name
  }

  alarm_actions     = [aws_autoscaling_policy.custom_cpu_policy.arn]
}

# Define auto descaling policy
resource "aws_autoscaling_policy" "custom_cpu_policy_downscale" {
  name            = "custom_cpu_policy_downscale"
  autoscaling_group_name = aws_autoscaling_group.custom_autoscale_group.name
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = -1
  cooldown = 100
  policy_type = "SimpleScaling"
}

# Define descaling cloud watch
resource "aws_cloudwatch_metric_alarm" "custum_cpu_alarm_downscale" {
  alarm_name          = "custom_cpu_alarm_downscale"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "20"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.custom_autoscale_group.name
  }

  alarm_actions     = [aws_autoscaling_policy.custom_cpu_policy_downscale.arn]
}