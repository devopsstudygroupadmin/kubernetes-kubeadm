# launch the ec2 instance 
resource "aws_instance" "worker01-instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_default_subnet.default-az1.id
  vpc_security_group_ids = [aws_security_group.kube-security-group.id]
  key_name               = "mobaxt_key"

  tags = {
    Name = "worker01-instance"
  }
}