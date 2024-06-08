#private

# Define route tables for private subnets
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "private route table"
  }
}

# Add default route to NAT Gateway for private route table
resource "aws_route" "nat_gateway_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

# Associate private subnets with the route table
resource "aws_route_table_association" "private_subnet_association" {
  count           = length(aws_subnet.private_subnets)
  subnet_id       = aws_subnet.private_subnets[count.index].id
  route_table_id  = aws_route_table.private_route_table.id
}


# public

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "public route table"
  }
}

# Create a default route to the internet gateway for the public route table
resource "aws_route" "internet_gateway_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_subnet_association" {
  count       = length(aws_subnet.public_subnets)
  subnet_id   = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}
