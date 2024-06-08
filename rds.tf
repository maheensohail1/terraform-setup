# Create an RDS instance for PostgreSQL
resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "16.2"
  instance_class       = "db.t3.micro"
  db_name              = "postgres"
  username             = "admin1"
  password             = "password1"  # Replace with a secure password
  db_subnet_group_name = aws_db_subnet_group.main.id
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot  = true

  tags = {
    Name = "my-postgres-db"
  }
}