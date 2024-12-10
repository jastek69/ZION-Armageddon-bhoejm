# TRANSIT GATEWAY
resource "aws_ec2_transit_gateway" "tgw" {
  provider = aws
  description = "Tokyo Transit Gateway"
  
}


resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach" {
  provider           = aws  
  subnet_ids         = [aws_subnet.public-ap-northeast-1a.id, aws_subnet.public-ap-southeast-2a]
  transit_gateway_id = aws_ec2_transit_gateway.public-ap-northeast-1a.id
  vpc_id             = aws_vpc.tmmc_tok_vpc.id

  tags = {
    Name = "TGA_tmmc_tok"
  }
}

## Transit Gateway Route Table for Tokyo
/* 
- Add two routes destined to the second and third VPC, which uses the second and third VPCs transit gateway attachment as an ingress.
- Associate the first transit gateway attachment to the route table, so its used as an egress.
*/

resource "aws_ec2_transit_gateway_route_table" "TGW_RTB_tmmc_tok" {
  provider = aws  
  transit_gateway_id = aws_ec2_transit_gateway.TGW_tmmc_tok.id

  tags = {
    "name" = "TGW_RTB_tmmc_tok"
  }
}


# Tokyo to London - Route 2
resource "aws_ec2_transit_gateway_route" "TGW_RTB_tmmc_tok_Route_3" {
  provider                       = aws 
  destination_cidr_block         = "10.241.0.0/16"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_tmmc_lon.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_tmmc_tok.id
}


#Tokyo to Sao Paulo - Route 3
resource "aws_ec2_transit_gateway_route" "TGW_RTB_tmmc_tok_Route_4" {
  provider = aws  
  destination_cidr_block         = "10.243.0.0/16"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_tmmc_sao.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_tmmc_tok.id
}

#Tokyo to California - Route 4
resource "aws_ec2_transit_gateway_route" "TGW_RTB_tmmc_tok_Route_5" {
  provider                       = aws 
  destination_cidr_block         = "10.244.0.0/16"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_tmmc_ca.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_tmmc_tok.id
}


#Tokyo to Hong Kong - Route 5
resource "aws_ec2_transit_gateway_route" "TGW_RTB_tmmc_tok_Route_2" {
  provider = aws  
  destination_cidr_block         = "10.245.0.0/16"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_tmmc_hk.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_tmmc_tok.id
}


#Tokyo to New York - Route 6
resource "aws_ec2_transit_gateway_route" "TGW_RTB_tmmc_tok_Route_6" {
  provider = aws  
  destination_cidr_block         = "10.246.0.0/16"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_tmmc_ny.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_tmmc_tok.id
}


# Tokyo to Australia - Route 1
resource "aws_ec2_transit_gateway_route" "TGW_RTB_tmmc_Route_1" {
  provider                       = aws 
  destination_cidr_block         = "10.247.0.0/16"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_tmmc_aus.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_tmmc_tok.id
}


resource "aws_ec2_transit_gateway_route_table_association" "TGW_RTB_tmmc_tok_Association_1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGA_tmmc_tok.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW_RTB_tmmc_tok.id
}
