resource "aws_lb" "gatus_alb" {
  name               = "gatus-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnets_id_list


  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}



resource "aws_lb_target_group" "gatus" {
  name        = "gatus-tg"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }


}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.gatus_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.gatus.arn
  }
}

