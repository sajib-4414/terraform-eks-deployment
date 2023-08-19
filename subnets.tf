#https://registry.terraform.io/providers/hashicorp/aws/3.9.0/docs/resources/subnet
# as per aws receommednation, we will create 2 public subnets, 2 private subnets
# each set of 1 public, 1 private will be deployed to the same av zone. 
resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.0.0/18" # last ip 192.168.63.255


  availability_zone = "us-east-1a"

  # required for eks instances lunched into the subnet should be assinged a public ip on launch
  #public subnet e node join korle public ip lagbe eks says
  # public subnet is also used for public load balancers
  map_public_ip_on_launch = true

  tags = {
    Name                        = "public-us-east-1a"
    "kubernetes.io/cluster/eks" = "shared" # required, allow eks to discover this subnet
    "kubernetes.io/cluster/elb" = 1        #required, allows eks to discover the subne and
    # and do public load balancer creaton in this subnet
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.64.0/18"

  availability_zone = "us-east-1b"

  # required for eks instances lunched into the subnet should be assinged a public ip on launch
  #public subnet e node join korle public ip lagbe eks says
  # public subnet is also used for public load balancers
  map_public_ip_on_launch = true

  tags = {
    Name                        = "private-us-east-1b"
    "kubernetes.io/cluster/eks" = "shared" # required, allow eks to discover this subnet
    "kubernetes.io/cluster/elb" = 1        #required, allows eks to discover the subne and
    # and do public load balancer creaton in this subnet
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.128.0/18"
  availability_zone = "us-east-1a"


  tags = {
    Name                        = "public-us-east-1a" # same as public 1
    "kubernetes.io/cluster/eks" = "shared"            # required, allow eks to discover this subnet
    "kubernetes.io/cluster/elb" = 1                   #required, allows eks to discover the subne and
    # and do public load balancer creaton in this subnet
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.192.0/18"
  availability_zone = "us-east-1b"


  tags = {
    Name                        = "private-us-east-1b" # same as public 1
    "kubernetes.io/cluster/eks" = "shared"             # required, allow eks to discover this subnet
    "kubernetes.io/cluster/elb" = 1                    #required, allows eks to discover the subne and
    # and do public load balancer creaton in this subnet
  }
}