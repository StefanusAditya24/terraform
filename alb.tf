resource "aws_lb" "web" {

  name = "web-alb"

  internal = false

  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  subnets = var.public_subnet_ids

}

resource "aws_lb_target_group" "web" {

  name = "web-target-group"

  port = 80

  protocol = "HTTP"

  vpc_id = var.vpc_id

  health_check {
    path = "/"
  }

}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.web.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.web.arn

  }

}