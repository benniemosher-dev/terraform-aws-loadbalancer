# TODO: Make this internal
# tfsec:ignore:aws-elb-alb-not-public
# checkov:skip=CKV_AWS_91:Access logging requires an S3 bucket configured by the caller
# checkov:skip=CKV2_AWS_20:HTTP-to-HTTPS redirect is the caller's responsibility
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

# checkov:skip=CKV_AWS_378:HTTP target group is intentional; module supports both HTTP and HTTPS
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

resource "aws_lb_target_group" "https" {
  count = var.config.certificate != null ? 1 : 0

  name        = "${var.config.cluster-name}-https"
  port        = 443
  protocol    = "HTTPS"
  target_type = "ip"
  vpc_id      = var.config.vpc

  health_check {
    enabled  = true
    path     = var.config.health-check-path
    protocol = "HTTPS"
  }

  depends_on = [
    aws_alb.this
  ]
}

# checkov:skip=CKV_AWS_2:HTTP listener is intentional; HTTPS is handled by a separate listener when a certificate is provided
# checkov:skip=CKV_AWS_103:HTTP listener has no TLS by design; TLS 1.2 is enforced on the HTTPS listener
resource "aws_lb_listener" "this" {
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  load_balancer_arn = aws_alb.this.arn
  port              = 80
  protocol          = "HTTP"
}

resource "aws_lb_listener" "https" {
  count = var.config.certificate != null ? 1 : 0

  certificate_arn = var.config.certificate
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https[0].arn
  }

  load_balancer_arn = aws_alb.this.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}
