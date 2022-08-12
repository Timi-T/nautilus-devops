aws_ami.ubuntu-t2: Refreshing state... [id=ami-052efd3df9dad4825]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:
  # aws_autoscaling_group.custom_autoscale_group will be created
  + resource "aws_autoscaling_group" "custom_autoscale_group" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 6
      + force_delete              = true
      + force_delete_warm_pool    = false
      + health_check_grace_period = 300
      + health_check_type         = "EC2"
      + id                        = (known after apply)
      + launch_configuration      = "custom_launch_config"
      + max_size                  = 10
      + metrics_granularity       = "1Minute"
      + min_size                  = 6
      + name                      = "custom_autoscale_group"
      + name_prefix               = (known after apply)
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + vpc_zone_identifier       = (known after apply)
      + wait_for_capacity_timeout = "10m"

      + tag {
          + key                 = "Name"
          + propagate_at_launch = true
          + value               = "custom-ec2-instance"
        }
    }

  # aws_autoscaling_policy.custom_cpu_policy will be created
  + resource "aws_autoscaling_policy" "custom_cpu_policy" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "custom_autoscale_group"
      + cooldown                = 100
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "custom_cpu_policy"
      + policy_type             = "SimpleScaling"
      + scaling_adjustment      = 1
    }

  # aws_autoscaling_policy.custom_cpu_policy_downscale will be created
  + resource "aws_autoscaling_policy" "custom_cpu_policy_downscale" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "custom_autoscale_group"
      + cooldown                = 100
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "custom_cpu_policy_downscale"
      + policy_type             = "SimpleScaling"
      + scaling_adjustment      = -1
    }

  # aws_cloudwatch_metric_alarm.custum_cpu_alarm will be created
  + resource "aws_cloudwatch_metric_alarm" "custum_cpu_alarm" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "This metric monitors ec2 cpu utilization"
      + alarm_name                            = "custom_cpu_alarm"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanOrEqualToThreshold"
      + dimensions                            = {
          + "AutoScalingGroupName" = "custom_autoscale_group"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 2
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/EC2"
      + period                                = 120
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 80
      + treat_missing_data                    = "missing"
    }

  # aws_cloudwatch_metric_alarm.custum_cpu_alarm_downscale will be created
  + resource "aws_cloudwatch_metric_alarm" "custum_cpu_alarm_downscale" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "This metric monitors ec2 cpu utilization"
      + alarm_name                            = "custom_cpu_alarm_downscale"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanOrEqualToThreshold"
      + dimensions                            = {
          + "AutoScalingGroupName" = "custom_autoscale_group"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 2
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/EC2"
      + period                                = 120
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 20
      + treat_missing_data                    = "missing"
    }

  # aws_key_pair.nautilus_autoscale_key will be created
  + resource "aws_key_pair" "nautilus_autoscale_key" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "nautilus_autoscale_key"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = "***"
      + tags_all        = (known after apply)
    }

  # aws_launch_configuration.custom_launch_config will be created
  + resource "aws_launch_configuration" "custom_launch_config" {
      + arn                         = (known after apply)
      + associate_public_ip_address = (known after apply)
      + ebs_optimized               = (known after apply)
      + enable_monitoring           = true
      + id                          = (known after apply)
      + image_id                    = "ami-052efd3df9dad4825"
      + instance_type               = "t2.micro"
      + key_name                    = "nautilus_autoscale_key"
      + name                        = "custom_launch_config"
      + name_prefix                 = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + no_device             = (known after apply)
          + snapshot_id           = (known after apply)
          + throughput            = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + throughput            = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 7 to add, 0 to change, 0 to destroy.