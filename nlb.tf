resource "aws_lb_target_group" "my-app-tg" {
  name     = "my-app-tg"
  port     = 8000
  protocol = "TCP"
  vpc_id   = aws_vpc.main_vpc.id

  health_check {
    enabled  = true
    protocol = "HTTP"
    path     = "/"
  }

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group_attachment" "my-app-tg" {
  target_group_arn = aws_lb_target_group.my-app-tg.arn
  target_id        = aws_instance.my-app.id
  port             = 8000
}

resource "aws_lb" "my-app-lb" {
  name               = "my-app-lb"
  internal           = true
  load_balancer_type = "network"

  subnets = [for subnet in aws_subnet.private : subnet.id]

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "my-app-lb" {
  load_balancer_arn = aws_lb.my-app-lb.arn
  port              = "8000"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-app-tg.arn
  }
}
