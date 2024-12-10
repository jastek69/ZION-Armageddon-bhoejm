resource "aws_eip" "nat" {
  provider = aws
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  provider = aws
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-ap-northeast-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}

/* 
# AUSTRALIA NAT
resource "aws_eip" "aus_nat" {
  provider = aws.australia
  vpc = true

  tags = {
    Name = "aus_nat"
  }
}

resource "aws_nat_gateway" "aus_nat" {
  provider = aws.australia
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-ap-southeast-2a.id

  tags = {
    Name = "aus_nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
*/

/* 
# Hong Kong NAT
resource "aws_eip" "hk_nat" {
  provider = aws.hongkong
  vpc = true

  tags = {
    Name = "hk_nat"
  }
}

resource "aws_nat_gateway" "hk_nat" {
  provider = aws.hongkong
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-ap-east-1a.id

  tags = {
    Name = "hk_nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
*/

# London
resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  provider = aws.london
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-eu-west-2a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}



# Sao Paulo
resource "aws_eip" "nat" {
  provider = aws.sao
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-sa-east-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}



#California
resource "aws_eip" "nat" {
  provider = aws.ca
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  provider = aws.ca
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-west-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
