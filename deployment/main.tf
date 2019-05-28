provider "aws" {
  region = "eu-west-1"
  access_key = "XXXX"
  secret_key = "XXXXXX"
}

resource "aws_security_group" "server_sg" {
  name = "server-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "server" {
  ami                    = "ami-030dbca661d402413"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.server_sg.id}"]
  key_name               = "senesero"
}

output "serverIp" {
  value = "${aws_instance.server.public_ip}"
}