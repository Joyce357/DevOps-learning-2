
provider "aws" {
  region = var.aws_region
  
}

resource "aws_instance" "bastion_host" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name        = "terraform-handson-bastion-host"
    Environment = "handson"
    Role        = "bastion"
  }
}
