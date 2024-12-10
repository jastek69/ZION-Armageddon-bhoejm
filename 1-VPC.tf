# Tokyo vpc.id which is aws_vpc.tmmc_tok_vpc.id
resource "aws_vpc" "tmmc_tok_vpc" {
  provider = aws
  cidr_block = "10.240.0.0/16"

  tags = {
    Name = "tmmc_tok_vpc"
    Service = "application1"
    Owner = "Balactus"
    Planet = "Taa"
  }
}


# Australia vpc.id which is aws_vpc.tmmc_aus_vpc.id
resource "aws_vpc" "tmmc_aus_vpc" {
  provider   = aws.australia
  cidr_block = "10.247.0.0/16"

  tags = {
    Name = "tmmc_aus_vpc"
    Service = "application1"
    Owner = "Blackneto"
    Planet = "Taa"
  }
}


# Hong Kong vpc.id which is aws_vpc.tmmc_hk_vpc.id
resource "aws_vpc" "tmmc_hk_vpc" {
  provider   = aws.hongkong
  cidr_block = "10.245.0.0/16"

  tags = {
    Name = "tmmc_hk_vpc"
    Service = "application1"
    Owner = "Blackneto"
    Planet = "Taa"
  }
}


# London vpc.id which is aws_vpc.tmmc_lon_vpc.id
resource "aws_vpc" "tmmc_lon_vpc" {
  provider   = aws.london
  cidr_block = "10.241.0.0/16"

  tags = {
    Name = "tmmc_lon_vpc"
    Service = "application1"
    Owner = "Blackneto"
    Planet = "Taa"
  }
}


# Sao Paulo vpc.id which is aws_vpc.tmmc_sao_vpc.id
resource "aws_vpc" "tmmc_sao_vpc" {
  provider   = aws.sao
  cidr_block = "10.243.0.0/16"

  tags = {
    Name = "tmmc_sao_vpc"
    Service = "application1"
    Owner = "Blackneto"
    Planet = "Taa"
  }
}


# California vpc.id which is aws_vpc.tmmc_ca_vpc.id
resource "aws_vpc" "tmmc_ca_vpc" {
  provider   = aws.ca
  cidr_block = "10.244.0.0/16"

  tags = {
    Name = "tmmc_lon_vpc"
    Service = "application1"
    Owner = "Blackneto"
    Planet = "Taa"
  }
}


# New York vpc.id which is aws_vpc.tmmc_lon_vpc.id
resource "aws_vpc" "tmmc_ny_vpc" {
  provider   = aws.london
  cidr_block = "10.246.0.0/16"

  tags = {
    Name = "tmmc_ny_vpc"
    Service = "application1"
    Owner = "Blackneto"
    Planet = "Taa"
  }
}
