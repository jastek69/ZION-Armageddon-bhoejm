# TOKYO
resource "aws_internet_gateway" "igw" {
  provider = aws
  vpc_id = aws_vpc.tmmc_tok_vpc.id

  tags = {
    Name    = "tmmc_tok_vpc_IG"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


# AUSTRALIA
resource "aws_internet_gateway" "aus_igw" {
  provider = aws.australia
  vpc_id = aws_vpc.tmmc_aus_vpc.id

  tags = {
    Name    = "tmmc_aus_vpc_IG"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}




# Hong Kong
resource "aws_internet_gateway" "hk_igw" {
  provider = aws.hongkong
  vpc_id = aws_vpc.tmmc_hk_vpc.id

  tags = {
    Name    = "tmmc_hk_vpc_IG"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

#London
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tmmc_lon_vpc.id

  tags = {
    Name    = "tmmc_lon_vpc_IG"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


#Sao Paulo
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tmmc_sao_vpc.id

  tags = {
    Name    = "tmmc_sao_vpc_IG"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


# California
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tmmc_ca_vpc.id

  tags = {
    Name    = "tmmc_ca_vpc_IG"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


#New York
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tmmc_nyc_vpc.id

  tags = {
    Name    = "tmmc_nyc_vpc_IG"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

