# TOKYO - Route
resource "aws_route_table" "private" {
  provider = aws
  # vpc_id = aws_vpc.tmmc_tok_vpc.id

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
      transit_gateway_id         = aws_ec2_transit_gateway.public-ap-northeast-1a.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  provider = aws
 # vpc_id = aws_vpc.tmmc_tok_vpc.id

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
      transit_gateway_id         = aws_ec2_transit_gateway.public-ap-northeast-1a.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "public"
  }
}

# Tokyo - Private
resource "aws_route_table_association" "private-ap-northeast-1a" {
  provider = aws
  subnet_id      = aws_subnet.private-ap-northeast-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-ap-northeast-1c" {
  provider = aws
  subnet_id      = aws_subnet.private-ap-northeast-1c.id
  route_table_id = aws_route_table.private.id
}


# Tokyo - Public
resource "aws_route_table_association" "public-ap-northeast-1a" {
  provider = aws
  subnet_id      = aws_subnet.public-ap-northeast-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-ap-northeast-1c" {
  provider = aws
  subnet_id      = aws_subnet.public-ap-northeast-1c.id
  route_table_id = aws_route_table.public.id
}



# NACL
resource "aws_default_network_acl" "default_nacl" {
  provider = aws
 # vpc_id = aws_vpc.tmmc_tok_vpc.id
  default_network_acl_id = aws_vpc.tmmc_tok_vpc.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.tmmc_tok_vpc.cidr_block
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    "name" = "Default_VPC_tmmctok_NACL"
  }
}



/**************************************************************************************************************/

# AUSTRALIA
resource "aws_route_table" "aus_private" {
  provider = aws.australia
  vpc_id = aws_vpc.tmmc_aus_vpc.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.aus_nat.id
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = aws_ec2_transit_gateway.public-ap-northeast-1a.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "aus_public" {
  provider = aws.australia
 # vpc_id = aws_vpc.tmmc_aus_vpc.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.aus_igw.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = aws_ec2_transit_gateway.public-ap-northeast-1a.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "public"
  }
}

# Australia Private
resource "aws_route_table_association" "private-ap-southeast-2a" {
  provider       = aws.australia
  subnet_id      = aws_subnet.private-ap-southeast-2a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-ap-southeast-2b" {
  provider       = aws.australia
  subnet_id      = aws_subnet.private-ap-southeast-2b.id
  route_table_id = aws_route_table.private.id
}


# Australia Public
resource "aws_route_table_association" "public-ap-southeast-2a" {
  provider       = aws.australia
  subnet_id      = aws_subnet.public-ap-southeast-2a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-ap-southeast-2b" {
  provider       = aws.australia
  subnet_id      = aws_subnet.public-ap-southeast-2b.id
  route_table_id = aws_route_table.public.id
}


/*************************************************************************************************************/


# Hong Kong
resource "aws_route_table" "hk_private" {
  provider = aws.hongkong
 # vpc_id = aws_vpc.tmmc_hk_vpc.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.hk_nat.id
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = aws_ec2_transit_gateway.public-ap-east-1a.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "hk_public" {
  provider = aws.hongkong
 # vpc_id = aws_vpc.tmmc_hk_vpc.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.hk_igw.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = aws_ec2_transit_gateway.public-ap-northeast-1a.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "public"
  }
}

# Hong Kong Private
resource "aws_route_table_association" "private-ap-east-1a" {
  provider       = aws.hongkong
  subnet_id      = aws_subnet.private-ap-east-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-ap-east-1b" {
  provider       = aws.hongkong
  subnet_id      = aws_subnet.private-ap-east-1b.id
  route_table_id = aws_route_table.private.id
}


# Hong Kong Public
resource "aws_route_table_association" "public-ap-east-1a" {
  provider       = aws.hongkong
  subnet_id      = aws_subnet.public-ap-east-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-ap-east-1b" {
  provider       = aws.hongkong
  subnet_id      = aws_subnet.public-ap-east-1b.id
  route_table_id = aws_route_table.public.id
}

/**************************************************************************************/
# London
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.tmmc_lon_vpc.id
  provider = aws.london

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
  provider = aws.london
  vpc_id = aws_vpc.tmmc_lon_vpc.id

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
resource "aws_route_table_association" "private-eu-west-2a" {
  provider = aws.london
  subnet_id      = aws_subnet.private-eu-west-2a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-eu-west-2b" {
  provider = aws.london
  subnet_id      = aws_subnet.private-eu-west-2b.id
  route_table_id = aws_route_table.private.id
}


# Public
resource "aws_route_table_association" "public-eu-west-2a" {
  provider = aws.london
  subnet_id      = aws_subnet.public-eu-west-2a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-eu-west-2b" {
  provider = aws.london
  subnet_id      = aws_subnet.public-eu-west-2b.id
  route_table_id = aws_route_table.public.id
}


/***********************************************************************/

# Sao Paulo
resource "aws_route_table" "private" {
  provider = aws.sao
  vpc_id = aws_vpc.tmmc_sao_vpc.id

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
  provider = aws.sao
  vpc_id = aws_vpc.tmmc_sao_vpc.id

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
resource "aws_route_table_association" "private-sa-east-1a" {
  provider = aws.sao
  subnet_id = aws_subnet.private-sa-east-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-sa-east-1b" {
  provider = aws.sao
  subnet_id = aws_subnet.private-sa-east-1b.id
  route_table_id = aws_route_table.private.id
}


# Public
resource "aws_route_table_association" "public-sa-east-1a" {
  provider = aws.sao
  subnet_id = aws_subnet.public-sa-east-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-sa-east-1b" {
  provider = aws.sao
  subnet_id = aws_subnet.public-sa-east-1b.id
  route_table_id = aws_route_table.public.id
}


/******************************************************************/
# California
resource "aws_route_table" "private" {
  provider = aws.ca
  vpc_id = aws_vpc.tmmc_ca_vpc.id

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
  provider = aws.ca
  vpc_id = aws_vpc.tmmc_ca_vpc.id

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
resource "aws_route_table_association" "private-us-west-1a" {
  provider = aws.ca
  subnet_id = aws_subnet.private-us-west-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-us-west-1b" {
  provider = aws.ca
  subnet_id = aws_subnet.private-us-west-1b.id
  route_table_id = aws_route_table.private.id
}


# Public
resource "aws_route_table_association" "public-us-west-1a" {
  provider = aws.ca
  subnet_id = aws_subnet.public-us-west-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-west-1b" {
  provider = aws.ca
  subnet_id = aws_subnet.public-us-west-1b.id
  route_table_id = aws_route_table.public.id
}


/*********************************************************************/
# New York
resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}







/*
# Transit Gateway

resource "aws_ec2_transit_gateway_vpc_attachment" "tmmc_tok_tgw_attach" {
  subnet_ids         = aws_subnet.public-ap-southeast-2a.id
  transit_gateway_id = aws_ec2_transit_gateway.public-ap-southeast-2a.id
  vpc_id             = aws_vpc.tmmc_tok_vpc.id
}
*/
