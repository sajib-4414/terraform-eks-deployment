resource "aws_vpc" "main" {
  #cidr block for the vpc
  cidr_block = "192.168.0.0/16"
  #makes your isntance shared on the host, dedicated cost extra
  instance_tenancy = "default"
  #required for eks, enable disable dns support in vpc
  enable_dns_support = true

  # required for eks, enable disable dns hostnames in the vpc.
  enable_dns_hostnames = true
  #enable disable classic link for vpc
  enable_classiclink             = false
  enable_classiclink_dns_support = false
  # to request aws provided ipv6 icdr block with /56 predix
  assign_generated_ipv6_cidr_block = false

  # map of tags to assign to the resource
  tags = {
    Name = "main"
  }
  
}
# to force some specific output
# this is useful if any module wants to use that
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC id."
  # setting an ouytput as value as sentitive prevents terraform from showing
  # its value in plan and apply
  sensitive = false
}