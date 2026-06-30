resource "aws_autoscaling_group" "web" {

  desired_capacity = 2

  min_size = 2

  max_size = 4

  vpc_zone_identifier = var.public_subnet_ids

  target_group_arns = [
    aws_lb_target_group.web.arn
  ]

  launch_template {

    id = aws_launch_template.web.id

    version = "$Latest"

  }

  health_check_type = "ELB"

}