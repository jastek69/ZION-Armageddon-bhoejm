# TOKYO
#These are   for  public
resource "aws_subnet" "public-ap-northeast-1a" {
  provider = aws
  vpc_id                  = aws_vpc.tmmc_tok_vpc.id
  cidr_block              = "10.240.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-1a"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "public-ap-northeast-1c" {
  vpc_id                  = aws_vpc.tmmc_tok_vpc.id
  cidr_block              = "10.240.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-1c"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}

#TOKYO Private
resource "aws_subnet" "private-ap-northeast-1a" {
  vpc_id            = aws_vpc.tmmc_tok_vpc.id
  cidr_block        = "10.240.11.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name    = "private-ap-northeast-1a"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "private-ap-northeast-1c" {
  vpc_id            = aws_vpc.tmmc_tok_vpc.id
  cidr_block        = "10.240.13.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name    = "private-ap-northeast-1c"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}

/***********************************************************************************/

# Australia
#Public
resource "aws_subnet" "public-ap-southeast-2a" {
  provider                = aws.australia
  vpc_id                  = aws_vpc.tmmc_aus_vpc.id
  cidr_block              = "10.247.1.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-southeast-2a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "public-ap-southeast-2b" {
  provider                = aws.australia
  vpc_id                  = aws_vpc.tmmc_aus_vpc.id
  cidr_block              = "10.247.2.0/24"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-southeast-2b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

#Australia private
resource "aws_subnet" "private-ap-southeast-2a" {
  provider          = aws.australia
  vpc_id            = aws_vpc.tmmc_aus_vpc.id
  cidr_block        = "10.247.11.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name    = "private-ap-southeast-2a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "private-ap-southeast-2b" {
  provider          = aws.australia
  vpc_id            = aws_vpc.tmmc_aus_vpc.id
  cidr_block        = "10.247.12.0/24"
  availability_zone = "ap-southeast-2b"

  tags = {
    Name    = "private-ap-southeast-2b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


/***********************************************************************************/

# Hong Kong
#Public
resource "aws_subnet" "public-ap-east-1a" {
  provider                = aws.hongkong
  vpc_id                  = aws_vpc.tmmc_hk_vpc.id
  cidr_block              = "10.245.1.0/24"
  availability_zone       = "ap-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-east-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "public-ap-east-1b" {
  provider                = aws.hongkong
  vpc_id                  = aws_vpc.tmmc_hk_vpc.id
  cidr_block              = "10.245.2.0/24"
  availability_zone       = "ap-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-east-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

#Hong Kong private
resource "aws_subnet" "private-ap-east-1a" {
  provider          = aws.hongkong
  vpc_id            = aws_vpc.tmmc_hk_vpc.id
  cidr_block        = "10.245.11.0/24"
  availability_zone = "ap-east-1a"

  tags = {
    Name    = "private-ap-east-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "private-ap-east-1b" {
  provider          = aws.hongkong
  vpc_id            = aws_vpc.tmmc_hk_vpc.id
  cidr_block        = "10.245.12.0/24"
  availability_zone = "ap-east-1b"

  tags = {
    Name    = "private-ap-east-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


/*********************************************************************************/

# London
#These are   for  public

resource "aws_subnet" "public-eu-west-2a" {
  vpc_id                  = aws_vpc.tmmc_lon_vpc.id
  cidr_block              = "10.241.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}



resource "aws_subnet" "public-eu-west-2b" {
  vpc_id                  = aws_vpc.tmmc_lon_vpc.id
  cidr_block              = "10.241.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

#these are for private
resource "aws_subnet" "private-eu-west-2a" {
  vpc_id            = aws_vpc.tmmc_lon_vpc.id
  cidr_block        = "10.241.11.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name    = "private-eu-west-2a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}




resource "aws_subnet" "private-eu-west-2b" {
  vpc_id            = aws_vpc.tmmc_lon_vpc.id
  cidr_block        = "10.241.12.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name    = "private-eu-west-2b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

/*******************************************************************************/

# Sao Paulo
#These are   for  public

resource "aws_subnet" "public-sa-east-1a" {
  vpc_id                  = aws_vpc.tmmc_sao_vpc.id
  cidr_block              = "10.243.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-sa-east-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "public-sa-east-1b" {
  vpc_id                  = aws_vpc.tmmc_sao_vpc.id
  cidr_block              = "10.243.2.0/24"
  availability_zone       = "sa-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-sa-east-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

#these are for private
resource "aws_subnet" "private-sa-east-1a" {
  vpc_id            = aws_vpc.tmmc_sao_vpc.id
  cidr_block        = "10.243.11.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name    = "private-sa-east-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "private-sa-east-1b" {
  vpc_id            = aws_vpc.tmmc_sao_vpc.id
  cidr_block        = "10.243.12.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name    = "private-sa-east-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

/******************************************************************************/

# California
#These are   for  public

resource "aws_subnet" "public-us-west-1a" {
  vpc_id                  = aws_vpc.tmmc_ca_vpc.id
  cidr_block              = "10.244.1.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "public-us-west-1b" {
  vpc_id                  = aws_vpc.tmmc_ca_vpc.id
  cidr_block              = "10.244.2.0/24"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-west-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

#these are for private
resource "aws_subnet" "private-us-west-1a" {
  vpc_id            = aws_vpc.tmmc_ca_vpc.id
  cidr_block        = "10.244.11.0/24"
  availability_zone = "us-west-1a"

  tags = {
    Name    = "private-us-west-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "private-us-west-1b" {
  vpc_id            = aws_vpc.tmmc_ca_vpc.id
  cidr_block        = "10.244.12.0/24"
  availability_zone = "us-west-1b"

  tags = {
    Name    = "private-us-west-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


/********************************************************************************/

# New York
#These are   for  public

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.tmmc_nyc_vpc.id
  cidr_block              = "10.246.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.tmmc_nyc_vpc.id
  cidr_block              = "10.246.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

#these are for private
resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.tmmc_nyc_vpc.id
  cidr_block        = "10.246.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "private-us-east-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.tmmc_nyc_vpc.id
  cidr_block        = "10.246.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = "private-us-east-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

