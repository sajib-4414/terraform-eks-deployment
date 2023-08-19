# https://registry.terraform.io/modules/tedilabs/network/aws/latest/submodules/nat-gateway

# we will create 2 nat gateway in 2 availablity zones
# eip may require igw to exist prior to association.
# use depends on set an explict dependency on the igw.
# we want to make sure aws igw is created,
# internet gateway was created with this name earlier, by using depends_on
# we are ensuring gateway creation must be done

resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.main]
}

resource "aws_eip" "nat2" {
  depends_on = [aws_internet_gateway.main]
}