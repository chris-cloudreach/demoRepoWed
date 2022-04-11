#####################
###Security Groups###
#####################

# Creates a security group for Database tier
resource "aws_security_group" "db" {
  name        = "${var.environment}-${var.app_name}-DB-SG"
  description = "Access to database"
  vpc_id      = data.terraform_remote_state.lz_state.outputs.vpc_id

  tags = {
    "Name" : "${var.environment}-${var.app_name}-DB-SG",
    "Environment" : var.environment,
    "Application" : var.app_name,
    "AppRole" : "DB"
  }
}

resource "aws_security_group_rule" "db_sql_rule" {
  type                     = "ingress"
  from_port                = 1433
  to_port                  = 1433
  protocol                 = "TCP"
  source_security_group_id = "aws_security_group.app.id"
  security_group_id        = aws_security_group.db.id
}

resource "aws_security_group_rule" "db_sql2_rule" {
  type              = "ingress"
  from_port         = 1433
  to_port           = 1433
  protocol          = "TCP"
  cidr_blocks       = ["10.100.0.0/16", "10.102.0.0/16", "10.195.0.0/16", "10.200.0.0/16", "10.3.0.0/16", "192.168.0.0/16"]
  security_group_id = aws_security_group.db.id
}

# Creates a security group for Application tier
resource "aws_security_group" "app" {
  name        = "${var.environment}-${var.app_name}-APP-SG"
  description = "Access to web application"
  vpc_id      = data.terraform_remote_state.lz_state.outputs.vpc_id

  tags = {
    "Name" : "${var.environment}-${var.app_name}-APP-SG",
    "Environment" : var.environment,
    "Application" : var.app_name,
    "AppRole" : "APP"
  }
}

resource "aws_security_group_rule" "app_lb_rule" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "TCP"
  source_security_group_id = "aws_security_group.lb.id"
  security_group_id        = aws_security_group.app.id
}

resource "aws_security_group_rule" "app_memcached_rule" {
  type                     = "ingress"
  from_port                = 11211
  to_port                  = 11211
  protocol                 = "TCP"
  source_security_group_id = "aws_security_group.app.id"
  security_group_id        = aws_security_group.app.id
}

resource "aws_security_group_rule" "app_egress_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/8"]
  security_group_id = aws_security_group.app.id
}

# Creates a security group for LB tier
resource "aws_security_group" "lb" {
  name        = "${var.environment}-${var.app_name}-LB-SG"
  description = "Access to web application load balancer"
  vpc_id      = data.terraform_remote_state.lz_state.outputs.vpc_id

  tags = {
    "Name" : "${var.environment}-${var.app_name}-LB-SG",
    "Environment" : var.environment,
    "Application" : var.app_name,
    "AppRole" : "LB"
  }
}

resource "aws_security_group_rule" "lb_80_rule" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = var.whitelist
  security_group_id = aws_security_group.lb.id
}

resource "aws_security_group_rule" "lb_443_rule" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "TCP"
  cidr_blocks       = var.whitelist
  security_group_id = aws_security_group.lb.id
}
