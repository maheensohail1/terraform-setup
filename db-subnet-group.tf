# Create a database subnet group
resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = aws_subnet.private_subnets[*].id

  tags = {
    Name = "main-subnet-group"
  }
}