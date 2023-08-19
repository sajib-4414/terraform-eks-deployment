#https://registry.terraform.io/providers/hashicorp/aws/3.53.0/docs/resources/route_table
# we will create one public route table for the public subnets
# as they can directly acess the internet
# we will create 2 more route tables for hte private subnets
# as they have to reach NAT gateways for internet access
# first route is auotmatically inherited from the main route table which is created default

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.main.id
  }


  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.main.id

  route {
    # we are creating second route inthe routing table
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw1.id
  }
  tags = {
    Name = "private1"
  }
}

resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.main.id

  route {
    # we are creating second route inthe routing table
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw2.id
  }
  tags = {
    Name = "private2"
  }
}