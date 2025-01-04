# instance.tf

resource "aws_instance" "ec2instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.app_sg.id]
  subnet_id     = aws_subnet.public.id
  key_name      = "ansible"
  
  tags = {
    Name = "${terraform.workspace}-${var.instance_names[count.index]}"
  }

  count = length(var.instance_names)
}

resource "aws_instance" "jenkins" {
  count = terraform.workspace == "prod" ? 1 : 0

  ami           = var.jenkins_ami_id
  instance_type = var.jenkins_instance_type
  security_groups = [aws_security_group.app_sg.id]
  subnet_id     = aws_subnet.public.id
  key_name      = "ansible"

  tags = {
    Name = "jenkins-${terraform.workspace}"
  }
}