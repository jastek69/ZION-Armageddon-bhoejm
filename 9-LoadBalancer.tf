# TOKYO 
resource "aws_lb" "tmmc_tok_lb01" {
  provider = aws
  name               = "tmmc-tok-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [
    aws_security_group.tmmc_tok_LB01-SG01-443.id, # Tokyo Security
    aws_security_group.tmmc_aus_LB01-SG01-443.id, # Australia Security Group
    aws_security_group.tmmc_hk_LB01-SG01-443.id,  # Hong Kong Security Group
    aws_security_group.tmmc_lon_LB01-SG01-443.id, # London Security
    aws_security_group.tmmc_sao_LB01-SG01-443.id, # Sao Paulo Security Group
    aws_security_group.tmmc_ca_LB01-SG01-443.id,  # California Security Group
    aws_security_group.tmmc_ny_LB01-SG01-443.id   # New York Security Group
    ] 
  subnets            = [
    aws_subnet.public-ap-northeast-1a.id,     # Tokyo Public AZ1
    aws_subnet.public-ap-northeast-1c.id,     # Tokyo Public AZ2
    aws_subnet.public-ap-southeast-2a.id,     # Australia Public AZ1
    aws_subnet.public-ap-southeast-2b.id,     # Australia Public AZ2
    aws_subnet.public-ap-east-1a.id,          # Hong Kong Public AZ1
    aws_subnet.public-ap-east-1b.id,          # Hong Kong Public AZ2
    aws_subnet.public-eu-west-2a.id,          # London Public AZ1
    aws_subnet.public-eu-west-2b.id,          # London Public AZ2
    aws_subnet.public-sa-east-1a.id,          # Sao Paulo Public AZ1
    aws_subnet.public-sa-east-1b.id,          # Sao Paulo Public AZ2
    aws_subnet.public-us-west-1a.id,          # California Public AZ1
    aws_subnet.public-us-west-1b.id,          # California Public AZ2
    aws_subnet.public-us-east-1a.id,          # New York Public AZ1
    aws_subnet.public-us-east-1b.id           # New York Public AZ2
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "tmmc_tok_LoadBalancer"
    Service = "tmmc_tok"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.tmmc_tok_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tmmc_tok_tg80.arn
  }
}

data "aws_acm_certificate" "cert" {
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "https" {
  provider = aws
  load_balancer_arn = aws_lb.tmmc_tok_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tmmc_tok_tg443.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.tmmc_tok_lb01.dns_name
  description = "The DNS name of the tmmc_tok Load Balancer."
}



/*

# AUSTRALIA Listener
resource "aws_lb_listener" "aus_http" {
  provider          = aws.australia
  load_balancer_arn = aws_lb.tmmc_tok_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tmmc_tok_tg80.arn
  }
}

data "aws_acm_certificate" "aus_cert" {
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "aus_https" {
  provider          = aws.australia
  load_balancer_arn = aws_lb.tmmc_tok_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tmmc_aus_tg443.arn
  }
}

output "lb_dns_name_aus" {
  value       = aws_lb.tmmc_tok_lb01.dns_name
  description = "The DNS name of the tmmc_aus Load Balancer."
}

/*********************************************************************************************************************/
# Hong Kong
/*
resource "aws_lb_listener" "http" {
  provider = aws.hongkong
  load_balancer_arn = aws_lb.tmmc_hk_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tmmc_hk_tg80.arn
  }
}

data "aws_acm_certificate" "cert" {
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "https" {
  provider = aws.hongkong
  load_balancer_arn = aws_lb.tmmc_hk_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tmmc_hk_tg443.arn
  }
}

output "lb_dns_name_hk" {
  value       = aws_lb.tmmc_hk_lb01.dns_name
  description = "The DNS name of the tmmc_hk Load Balancer."
}
*/
