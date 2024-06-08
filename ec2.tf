# 

 resource "aws_instance" "ubuntu_instance_frontend" {
  ami                    = "ami-04b70fa74e45c3917" # Ubuntu 20.04 AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnets[0].id # Hardcoded subnet ID for Ubuntu instance
  key_name               = "tf_test"
  security_groups        = [aws_security_group.ubuntu_sg_frontend.id] # Assign Ubuntu security group
   tags = {
    Name = "ec2-frontend"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  user_data = templatefile("${path.module}/ubuntu_userdata.sh", {})
}
resource "aws_instance" "ubuntu_instance_backend" {
  ami                    = "ami-04b70fa74e45c3917" # Ubuntu 20.04 AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnets[1].id # Hardcoded subnet ID for Ubuntu instance
  key_name               = "tf_test"
  security_groups        = [aws_security_group.ubuntu_sg_backend.id] # Assign Ubuntu security group
   tags = {
    Name = "ec2-backend"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  user_data = templatefile("${path.module}/ubuntu_userdata.sh", {})
}

resource "aws_instance" "ubuntu_instance_metabase" {
  ami                    = "ami-04b70fa74e45c3917" # Ubuntu 20.04 AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnets[2].id # Hardcoded subnet ID for Ubuntu instance
  key_name               = "tf_test"
  security_groups        = [aws_security_group.ubuntu_sg_backend.id] # Assign Ubuntu security group
   tags = {
    Name = "ec2-metabase"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  user_data = templatefile("${path.module}/ubuntu_userdata.sh", {})
}


resource "aws_instance" "public_ubuntu_instance" {
  count                  = 2
  ami                    = "ami-04b70fa74e45c3917" # Ubuntu 20.04 AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnets[count.index].id # Hardcoded subnet ID for Ubuntu instance
  key_name               = "tf_test"
  security_groups        = [aws_security_group.ubuntu_sg_backend.id] # Assign Ubuntu security group
   tags = {
    Name = "bastion-${count.index}"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  user_data = templatefile("${path.module}/ubuntu_userdata.sh", {})
}
# resource "aws_instance" "amazon_linux_2_instance" {
#   ami                    = "ami-04ff98ccbfa41c9ad" # Amazon Linux 2 AMI ID
#   instance_type          = "t2.micro"
#   subnet_id              = "subnet-0f62ae5bf37c808ab" # Hardcoded subnet ID for Amazon Linux 2 instance
#   key_name               = "tf_test"
#   security_groups        = [aws_security_group.amazon_linux_sg.id] # Assign Amazon Linux 2 security group
#   tags = {
#     Name = "tf_created_ec2_amazon_linux_2"
#   }

#   root_block_device {
#     volume_size = 8
#     volume_type = "gp3"
#   }

#   user_data = templatefile("${path.module}/al2_userdata.sh", {})
# }

# resource "aws_instance" "amazon_linux_2023_instance" {
#   ami                    = "ami-0bb84b8ffd87024d8" # Amazon Linux 2023 AMI ID
#   instance_type          = "t2.micro"
#   subnet_id              = "subnet-0e52b5dbc355b8ccb" # Hardcoded subnet ID for Amazon Linux 2023 instance
#   key_name               = "tf_test"
#   security_groups        = [aws_security_group.amazon_linux_sg.id] # Assign Amazon Linux 2023 security group
#   tags = {
#     Name = "tf_created_ec2_amazon_linux_2023"
#   }

#   root_block_device {
#     volume_size = 8
#     volume_type = "gp3"
#   }

#   user_data = templatefile("${path.module}/al2023_userdata.sh", {})
# }
