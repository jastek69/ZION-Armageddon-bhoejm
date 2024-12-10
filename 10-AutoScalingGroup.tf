# TOKYO Auto Scaling Group
resource "aws_autoscaling_group" "tmmc_tok_asg80" {
  provider = aws
  name_prefix           = "tmmc_tok-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.public-ap-northeast-1a.id,    
    aws_subnet.public-ap-northeast-1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_tok_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_tok_LT-multiapp80.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_tok-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Test"
    propagate_at_launch = true
  }
}


# TOKYO Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_tok_scaling_policy" {
  provider = aws
  name                   = "tmmc_tok-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_tok_asg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# TOKYO - Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_tok_asg80_attachment" {
  autoscaling_group_name = aws_autoscaling_group.tmmc_tok_asg80.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_tok_tg80.arn
}


# TOKYO - ASG 443 - Secure
resource "aws_autoscaling_group" "tmmc_tok_asg443" {
  name_prefix           = "tmmc_tok443-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-ap-northeast-1a.id,
    aws_subnet.private-ap-northeast-1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_tok_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_tok_LT-multiapp443.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # TOKYO - Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # TOKYO - Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_tok-instance-443"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# TOKYO 443 - Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_tok443_scaling_policy" {
  provider = aws
  name                   = "tmmc_tok-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_tok_asg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# TOKYO 443 - Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_tok443_asg_attachment" {
  provider = aws
  autoscaling_group_name = aws_autoscaling_group.tmmc_tok_asg443.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_tok_tg443.arn
}



/***************************************************************************************************************************/
# AUSTRALIA Auto Scaling Group
resource "aws_autoscaling_group" "tmmc_aus_asg80" {
  provider              = aws.australia
  name_prefix           = "tmmc_aus-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.public-ap-southeast-2a.id,    
    aws_subnet.public-ap-southeast-2b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_aus_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_aus_LT-multiapp80.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # AUSTRALIA Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # AUSTRALIA Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_aus-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Test"
    propagate_at_launch = true
  }
}


# AUSTRALIA Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_aus_scaling_policy" {
  provider               = aws.australia
  name                   = "tmmc_aus-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_aus_asg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# AUSTRALIA Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_aus_asg80_attachment" {
  provider               = aws.australia
  autoscaling_group_name = aws_autoscaling_group.tmmc_aus_asg80.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_aus_tg80.arn
}


# AUSTRALIA ASG 443 - Secure
resource "aws_autoscaling_group" "tmmc_aus_asg443" {
  provider              = aws.australia
  name_prefix           = "tmmc_aus443-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-ap-southeast-2a.id,
    aws_subnet.private-ap-southeast-2b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_aus_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_aus_LT-multiapp443.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_aus-instance-443"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# AUSTRALIA Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_aus443_scaling_policy" {
  provider               = aws.australia
  name                   = "tmmc_aus-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_aus_asg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# AUSTRALIA Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_aus443_asg_attachment" {
  provider               = aws.australia
  autoscaling_group_name = aws_autoscaling_group.tmmc_aus_asg443.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_aus_tg443.arn
}


/*********************************************************************************************************/

#Hong Kong

resource "aws_autoscaling_group" "tmmc_hk_tg80" {
  provider = aws.hongkong
  name_prefix           = "tmmc_hk-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-ap-east-1a.id,    
    aws_subnet.private-ap-east-1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_hk_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_hk_LT-multiapp80.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_hk-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Test"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_hk_scaling_policy" {
  provider               = aws.hongkong
  name                   = "tmmc_hk-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_hk_tg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_hk_tg80_attachment" {
  provider               = aws.hongkong
  autoscaling_group_name = aws_autoscaling_group.tmmc_hk_tg80.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_hk_tg80.arn
}


# ASG 443 - Secure
resource "aws_autoscaling_group" "tmmc_hk_asg443" {
  provider              = aws.hongkong
  name_prefix           = "tmmc_hk443-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-ap-east-1a.id,
    aws_subnet.private-ap-east-1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_hk_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_hk_LT-multiapp443.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_hk-instance-443"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_hk443_scaling_policy" {
  provider               = aws.hongkong
  name                   = "tmmc_hk-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_hk_tg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_hk443_asg_attachment" {
  provider               = aws.hongkong
  autoscaling_group_name = aws_autoscaling_group.tmmc_hk_asg443.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_hk_tg443.arn
}


/**************************************************************************************************/

# London
resource "aws_autoscaling_group" "tmmc_lon_tg80" {
  provider = aws.lon
  name_prefix           = "tmmc_lon-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-eu-west-2a.id,    
    aws_subnet.private-eu-west-2b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_lon_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_lon_LT-multiapp80.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_lon-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Test"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_lon_scaling_policy" {
  provider = aws.lon
  name                   = "tmmc_lon-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_lon_tg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_lon_tg80_attachment" {
  provider = aws.lon
  autoscaling_group_name = aws_autoscaling_group.tmmc_lon_tg80.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_lon_tg80.arn
}


# ASG 443 - Secure
resource "aws_autoscaling_group" "tmmc_lon_asg443" {
  provider = aws.lon
  name_prefix           = "tmmc_lon443-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-eu-west-2a.id,
    aws_subnet.private-eu-west-2b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_lon_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_lon_LT-multiapp443.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_lon-instance-443"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_lon443_scaling_policy" {
  provider = aws.lon
  name                   = "tmmc_lon-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_lon_tg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_lon443_asg_attachment" {
  provider = aws.lon
  autoscaling_group_name = aws_autoscaling_group.tmmc_lon_asg443.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_lon_tg443.arn
}

/********************************************************************************************/

# Sao Paulo
resource "aws_autoscaling_group" "tmmc_sao_tg80" {
  provider = aws.sao
  name_prefix           = "tmmc_sao-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-sa-east-1a.id,    
    aws_subnet.private-sa-east-1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_sao_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_sao_LT-multiapp80.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_sao-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Test"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_sao_scaling_policy" {
  provider = aws.sao
  name                   = "tmmc_sao-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_sao_tg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_sao_tg80_attachment" {
  autoscaling_group_name = aws_autoscaling_group.tmmc_sao_tg80.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_sao_tg80.arn
}


# ASG 443 - Secure
resource "aws_autoscaling_group" "tmmc_sao_asg443" {
  provider = aws.sao
  name_prefix           = "tmmc_sao443-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-sa-east-1a.id,
    aws_subnet.private-sa-east-1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_sao_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_sao_LT-multiapp443.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_sao-instance-443"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_sao443_scaling_policy" {
  provider = aws.sao
  name                   = "tmmc_sao-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_sao_tg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_sao443_asg_attachment" {
  provider = aws.sao
  autoscaling_group_name = aws_autoscaling_group.tmmc_sao_asg443.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_sao_tg443.arn
}

/**********************************************************************************************/
# California

resource "aws_autoscaling_group" "tmmc_ca_tg80" {
  provider = aws.ca
  name_prefix           = "tmmc_ca-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-us-west-1a.id,    
    aws_subnet.private-us-west-1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_ca_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_ca_LT-multiapp80.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_ca-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Test"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_ca_scaling_policy" {
  provider = aws.ca
  name                   = "tmmc_ca-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_ca_tg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_ca_tg80_attachment" {
  provider = aws.ca
  autoscaling_group_name = aws_autoscaling_group.tmmc_ca_tg80.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_ca_tg80.arn
}


# ASG 443 - Secure
resource "aws_autoscaling_group" "tmmc_ca_asg443" {
  provider = aws.ca
  name_prefix           = "tmmc_ca443-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.private-us-west-1a.id,
    aws_subnet.private-us-west-1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tmmc_ca_tg80.arn]

  launch_template {
    id      = aws_launch_template.tmmc_ca_LT-multiapp443.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "tmmc_ca-instance-443"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "tmmc_ca443_scaling_policy" {
  provider = aws.ca
  name                   = "tmmc_ca-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tmmc_ca_tg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "tmmc_ca443_asg_attachment" {
  provider = aws.ca
  autoscaling_group_name = aws_autoscaling_group.tmmc_ca_asg443.name
  alb_target_group_arn   = aws_lb_target_group.tmmc_ca_tg443.arn
}
