# https://registry.terraform.io/providers/hashicorp/aws/3.53.0/docs/resources/nat_gateway

#nate gateway translates the private IPs to public IPs, for public appearances to access internet
# nat gateway will be put into public subnets with a default to IGW
resource "aws_nat_gateway" "gw1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public_1.id # has to be a public subnet

  tags = {
    Name = "NAT 1"
  }
}

resource "aws_nat_gateway" "gw2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public_2.id # has to be a public subnet

  tags = {
    Name = "NAT 2"
  }
}