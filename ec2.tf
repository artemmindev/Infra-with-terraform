resource "aws_instance" "my-app" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  key_name      = "devops"
  subnet_id     = aws_subnet.public-eu-central-1a.id

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.my-app-sg.id]

  tags = {
    Name = "my-app"
  }

  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install -y nginx
  systemctl start nginx
  EOF
}