# https://registry.terraform.io/providers/hashicorp/aws/3.64.1/docs/resources/internet_gateway


resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}