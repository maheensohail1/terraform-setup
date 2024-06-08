# Create NAT Gateways
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "my-nat-gateway"
  }
}