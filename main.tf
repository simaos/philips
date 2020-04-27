provider "aws"{
  region     = "us-east-1"
}

resource "aws_security_group" "cicd"{

  name = "testing-us-east-1"
  vpc_id = "vpc-1ab61663"
  tags = {
    Name = "CICD"
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_key_pair" "dev" {
  key_name   = "dev"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAdzQoLNYCqmdSGBBwIKK9VkLdGeRq20hES0uP9rqqOSz8mSUXYSPc3CkvuDpKtGD3OP1RfX+x5HMnfgtjsIh7eIABkCnNO+F/x8tzcwgj/FE0CxjjtjChcjPFO2yJg4Cwbnyc50TlrdL0Z8kkpkAX75aeiQhOojYhf4y2Wh9glDNa19kzyoS4zQVhpp3Jsnn+w3xixnF1OwXFjMwop7rzMPE5tTxG6IBbRKRbl/s4RHSNpISJnEiVeHbzGCcgrA9PH+NKla+jU/s5nUX75/sYuYOtQaC2FzH/ATVq63/OcBT10xoBW7OdZEuqpTbeXmIsiuwEt5c/oJ7APjdgU5cn deepakkumar.biswas@NXP-MAC1-NXF49738.local"
  tags = {
    Name = "CICD"
  }
}

resource "aws_instance" "utility" {
  ami           = "ami-085925f297f89fce1"
  instance_type = "t2.small"
  key_name = aws_key_pair.dev.id
  vpc_security_group_ids = [aws_security_group.cicd.id]
  subnet_id = "subnet-0554f05f"
  tags = {
    Name = "Test1"
  }
  depends_on = [aws_key_pair.dev, aws_security_group.cicd]
}

resource "aws_instance" "target" {
  ami           = "ami-085925f297f89fce1"
  instance_type = "t2.small"
  key_name =  aws_key_pair.dev.id
  vpc_security_group_ids = [aws_security_group.cicd.id]
  subnet_id = "subnet-0554f05f"

  tags = {
    Name = "Test2"
  }
  depends_on = [aws_key_pair.dev, aws_security_group.cicd]
}

output "Security_ID" {
  value = aws_security_group.cicd.id
  description = "Security Group ID"
}

output "Key_Pair" {
  value = aws_key_pair.dev.id
  description = "Key Pair ID"
}

output "Ec2_Instance_ID" {
  value = [aws_instance.utility.id , aws_instance.target.id]
  description = "This is Jenkins and Target Host Instances ID"
}