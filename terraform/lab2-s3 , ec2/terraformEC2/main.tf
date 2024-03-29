# hcl
provider "aws" {
  region = "us-east-1"
}
# resource "aws_key_pair" "my_key_pair" {
#   key_name   = "akilakey"   # Change to your desired key pair name
#   public_key = file("~/.ssh/akilakey.pub")  # Provide the path to your public key file
# }
resource "aws_instance" "web_server" {
  ami           = "ami-05c13eab67c5d8861" 
  instance_type = "t2.micro"  
  key_name      = "akilaKeyLab"          
  tags = {
    Name = "AkilaEC2InstanceDynamic"
  }

}

resource "aws_security_group" "web_server_security_group" {
  name_prefix = "web-server-Akila-sg"

  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


