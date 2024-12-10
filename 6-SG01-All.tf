# TOKYO SECURITY GROUPS
# TOKYO Target Group for Port 80 app
resource "aws_security_group" "tmmc_tok_TG01-SG01-80" {
  provider = aws
  name        = "tmmc_tok_TG01-SG01-80"
  description = "tmmc_tok_TG01-SG01-80"
  vpc_id      = aws_vpc.tmmc_tok_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_tok_TG01-SG01-80"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}



# TOKYO LOAD BALANCER SEC GROUP on Port 443
resource "aws_security_group" "tmmc_tok_LB01-SG01-443" {
  provider = aws
  name        = "tmmc_tok_LB01-SG01-443"
  description = "tmmc_tok_LB01-SG01-443"
  vpc_id      = aws_vpc.tmmc_tok_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_tok_LB01-SG01-443"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


# TOKYO Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "tmmc_tok_SL01-SG01-443" {
  provider = aws
  name        = "tmmc_tok_SL01-SG01-443"
  description = "tmmc_tok_SL01-SG01-443"
  vpc_id      = aws_vpc.tmmc_tok_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_tok_SL01-SG01-443"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}

/*****************************************************************************************************************/

# AUSTRALIA SECURITY GROUPS
#Target Group for Port 80 app
resource "aws_security_group" "tmmc_aus_TG01-SG01-80" {
  provider    = aws.australia
  name        = "tmmc_aus_TG01-SG01-80"
  description = "tmmc_aus_TG01-SG01-80"
  vpc_id      = aws_vpc.tmmc_aus_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_aus_TG01-SG01-80"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


# AUSTRALIA LOAD BALANCER SEC GROUP on Port 443
resource "aws_security_group" "tmmc_aus_LB01-SG01-443" {
  provider    = aws.australia
  name        = "tmmc-aus-LB01-SG01-443"
  description = "tmmc-aus-LB01-SG01-443"
  vpc_id      = aws_vpc.tmmc_aus_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_aus_LB01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


# AUSTRALIA Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "tmmc_aus_SL01-SG01-443" {
  provider    = aws.australia
  name        = "tmmc-aus_SL01-SG01-443"
  description = "tmmc-aus_SL01-SG01-443"
  vpc_id      = aws_vpc.tmmc_aus_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc-aus-SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

/****************************************************************************************/

# HONG KONG SECURITY GROUPS
#Target Group for Port 80 app
resource "aws_security_group" "tmmc_hk_TG01-SG01-80" {
  provider    = aws.hongkong
  name        = "tmmc_hk_TG01-SG01-80"
  description = "tmmc_hk_TG01-SG01-80"
  vpc_id      = aws_vpc.tmmc_hk_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_hk_TG01-SG01-80"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


# HONG KONG - LOAD BALANCER SEC GROUP on Port 443
resource "aws_security_group" "tmmc_hk_LB01-SG01-443" {
  provider    = aws.hongkong
  name        = "tmmc-hk-LB01-SG01-443"
  description = "tmmc_hk_LB01-SG01-443"
  vpc_id      = aws_vpc.tmmc_aus_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_hk_LB01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


# Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "tmmc_hk_SL01-SG01-443" {
  provider    = aws.hongkong
  name        = "tmmc_hk_SL01-SG01-443"
  description = "tmmc_hk_SL01-SG01-443"
  vpc_id      = aws_vpc.tmmc_hk_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_hk_SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


/******************************************************************/
# New York
resource "aws_route_table" "private" {
  provider = aws.ny
  vpc_id = aws_vpc.tmmc_nyc_vpc.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.nat.id
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  provider = aws.ny
  vpc_id = aws_vpc.tmmc_nyc_vpc.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "public"
  }
}

# Private
resource "aws_route_table_association" "private-us-east-1a" {
  provider = aws.ny
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-us-east-1b" {
  provider = aws.ny
  subnet_id      = aws_subnet.private-us-east-1b.id
  route_table_id = aws_route_table.private.id
}


# Public
resource "aws_route_table_association" "public-us-east-1a" {
  provider = aws.ny
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-east-1b" {
  provider = aws.ny
  subnet_id      = aws_subnet.public-us-east-1b.id
  route_table_id = aws_route_table.public.id
}


/***********************************************************************/
# London
#Target Group for Port 80 app
resource "aws_security_group" "tmmc_lon_TG01-SG01-80" {
  provider = aws.lon
  name        = "tmmc_lon_TG01-SG01-80"
  description = "tmmc_lon_TG01-SG01-80"
  vpc_id      = aws_vpc.tmmc_lon_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_lon_TG01-SG01-80"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}



# LOAD BALANCER SEC GROUP on Port 443
resource "aws_security_group" "tmmc_lon_LB01-SG01-443" {
  provider = aws.lon
  name        = "tmmc-lon_LB01-SG01-443"
  description = "tmmc_lon_LB01-SG01-443"
  vpc_id      = aws_vpc.tmmc_lon_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_lon_LB01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}


# Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "tmmc_lon_SL01-SG01-443" {
  provider = aws.lon
  name        = "tmmc_lon_SL01-SG01-443"
  description = "tmmc_lon_SL01-SG01-443"
  vpc_id      = aws_vpc.tmmc_lon_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_lon_SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}


/*******************************************************************/
# Sao Paulo
#Target Group for Port 80 app
resource "aws_security_group" "tmmc_sao_TG01-SG01-80" {
  provider = aws.sao
  name        = "tmmc_sao_TG01-SG01-80"
  description = "tmmc_sao_TG01-SG01-80"
  vpc_id      = aws_vpc.tmmc_sao_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_sao_TG01-SG01-80"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}



# LOAD BALANCER SEC GROUP on Port 443
resource "aws_security_group" "tmmc_sao_LB01-SG01-443" {
  provider = aws.sao
  name        = "tmmc-lon_LB01-SG01-443"
  description = "tmmc_sao_LB01-SG01-443"
  vpc_id      = aws_vpc.tmmc_sao_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_sao_LB01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}


# Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "tmmc_sao_SL01-SG01-443" {
  provider = aws.sao
  name        = "tmmc_sao_SL01-SG01-443"
  description = "tmmc_sao_SL01-SG01-443"
  vpc_id      = aws_vpc.tmmc_sao_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_sao_SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}

/********************************************************************/

# California
#Target Group for Port 80 app
resource "aws_security_group" "tmmc_ca_TG01-SG01-80" {
  provider = aws.ca
  name        = "tmmc_ca_TG01-SG01-80"
  description = "tmmc_ca_TG01-SG01-80"
  vpc_id      = aws_vpc.tmmc_ca_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_ca_TG01-SG01-80"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}



# LOAD BALANCER SEC GROUP on Port 443
resource "aws_security_group" "tmmc_ca_LB01-SG01-443" {
  provider = aws.ca
  name        = "tmmc-lon_LB01-SG01-443"
  description = "tmmc_ca_LB01-SG01-443"
  vpc_id      = aws_vpc.tmmc_ca_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_ca_LB01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}


# Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "tmmc_ca_SL01-SG01-443" {
  provider = aws.ca
  name        = "tmmc_ca_SL01-SG01-443"
  description = "tmmc_ca_SL01-SG01-443"
  vpc_id      = aws_vpc.tmmc_ca_vpc.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tmmc_ca_SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}
