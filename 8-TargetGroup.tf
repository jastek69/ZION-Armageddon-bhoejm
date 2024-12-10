# TOKYO Target Groups
resource "aws_lb_target_group" "tmmc_tok_tg80" {
  provider = aws
  name     = "tmmc-tok-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_tok_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-tokTargetGroup"
    Service = "tmmc_tok"
    Owner   = "Balactus"
    Project = "App1"
  }
}


resource "aws_lb_target_group" "tmmc_tok_tg443" {
  provider = aws
  name     = "tmmc-tok-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_tok_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-tokTargetGroup443"
    Service = "SysLog"
    Owner   = "User"
    Project = "App2"
  }
}


/*******************************************************************************/
# AUSTRALIA Target Groups
resource "aws_lb_target_group" "tmmc_aus_tg80" {
  provider = aws.australia
  name     = "tmmc-aus-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_aus_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-aus-TargetGroup"
    Service = "tmmc_aus"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "tmmc_aus_tg443" {
  provider = aws.australia
  name     = "tmmc-aus-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_aus_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-ausTargetGroup443"
    Service = "SysLog"
    Owner   = "User"
    Project = "SysLog"
  }
}

/***********************************************************************************************************/

#Hong Kong
resource "aws_lb_target_group" "tmmc_hk_tg80" {
  provider = aws.hongkong
  name     = "tmmc-hk-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_hk_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-hk-TargetGroup"
    Service = "tmmc_hk"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "tmmc_hk_tg443" {
  provider = aws.hongkong
  name     = "tmmc-hk-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_hk_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-hkTargetGroup443"
    Service = "SysLog"
    Owner   = "User"
    Project = "SysLog"
  }
}


/***************************************************************************/
# London
resource "aws_lb_target_group" "tmmc_lon_tg80" {
  provider = aws.lon
  name     = "tmmc-lon-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_lon_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-lon-TargetGroup"
    Service = "tmmc_lon"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "tmmc_lon_tg443" {
  provider = aws.lon
  name     = "tmmc-lon-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_lon_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-lonTargetGroup443"
    Service = "SysLog"
    Owner   = "User"
    Project = "SysLog"
  }
}


/****************************************************************************/
# Sao Paulo
resource "aws_lb_target_group" "tmmc_sao_tg80" {
  provider = aws.sao
  name     = "tmmc-sao-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_sao_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-sao-TargetGroup"
    Service = "tmmc_sao"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "tmmc_sao_tg443" {
  provider = aws.sao
  name     = "tmmc-sao-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_sao_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-saoTargetGroup443"
    Service = "SysLog"
    Owner   = "User"
    Project = "SysLog"
  }
}

/***********************************************************************************************/

# California
resource "aws_lb_target_group" "tmmc_ca_tg80" {
  provider = aws.ca
  name     = "tmmc-ca-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_ca_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-ca-TargetGroup"
    Service = "tmmc_ca"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "tmmc_ca_tg443" {
  provider = aws.ca
  name     = "tmmc-ca-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_ca_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-caTargetGroup443"
    Service = "SysLog"
    Owner   = "User"
    Project = "SysLog"
  }
}


/****************************************************************************/
# New York

resource "aws_lb_target_group" "tmmc_nyc_tg80" {
  provider = aws.ny
  name     = "tmmc-nyc-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_nyc_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-nyc-TargetGroup"
    Service = "tmmc_nyc"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "tmmc_nyc_tg443" {
  provider = aws.ny
  name     = "tmmc-nyc-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tmmc_nyc_vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tmmc-nycTargetGroup443"
    Service = "SysLog"
    Owner   = "User"
    Project = "SysLog"
  }
}
