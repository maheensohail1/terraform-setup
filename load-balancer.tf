# Create a load balancer
resource "aws_lb" "frontend_backend_lb" {
  name               = "frontend-backend-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = aws_subnet.private_subnets[*].id

  tags = {
    Name = "frontend-backend-lb"
  }
}

# Create a target group for the load balancer
resource "aws_lb_target_group" "frontend_backend_target_group" {
  name     = "frontend-backend-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "80"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }
}

# Attach the EC2 instances to the target group
resource "aws_lb_target_group_attachment" "frontend_attachment" {
  target_group_arn = aws_lb_target_group.frontend_backend_target_group.arn
  target_id       = aws_instance.ubuntu_instance_frontend.id
}
resource "aws_lb_target_group_attachment" "backend_attachment" {
  target_group_arn = aws_lb_target_group.frontend_backend_target_group.arn
  target_id       = aws_instance.ubuntu_instance_backend.id
}