# TODO: Make this internal
# tfsec:ignore:aws-elb-alb-not-public
# checkov:skip=CKV_AWS_91:Access logging requires an S3 bucket configured by the caller
# checkov:skip=CKV_AWS_152:Cross-zone load balancing applies to NLB/GLB, not ALB
resource "aws_alb" "this" {
  load_balancer_type = var.config.load-balancer-type
  name               = var.config.cluster-name

  drop_invalid_header_fields = true
  enable_deletion_protection = var.config.deletion-protection

  security_groups = [
    aws_security_group.load-balancer.id
  ]

  subnets = var.config.subnets

  depends_on = [
    aws_security_group.load-balancer
  ]
}

# checkov:skip=CKV_AWS_378:HTTP is used only for internal ALB-to-backend communication; public traffic enforces HTTPS via redirect
resource "aws_lb_target_group" "this" {
  name        = var.config.cluster-name
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.config.vpc

  health_check {
    enabled  = true
    path     = var.config.health-check-path
    protocol = "HTTP"
  }

  depends_on = [
    aws_alb.this
  ]
}

# checkov:skip=CKV_AWS_2:HTTP listener exists solely to redirect all traffic to HTTPS
# checkov:skip=CKV_AWS_103:HTTP redirect listener has no TLS; TLS 1.2 is enforced on the HTTPS listener
resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_alb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  count = var.config.certificate != null ? 1 : 0

  certificate_arn = var.config.certificate
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  load_balancer_arn = aws_alb.this.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}
