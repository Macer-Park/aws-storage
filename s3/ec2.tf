resource "aws_instance" "EC2STG1" {
  instance_type               = "t2.micro"
  ami                         = var.ami
  iam_instance_profile        = aws_iam_instance_profile.stg_lab_instsance_profile.name
  key_name                    = var.keypair
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.MyPublicSN1.id
  security_groups             = [aws_security_group.MySG.id]
  private_ip                  = "10.40.1.10"

  tags = {
    Name = "EC2-STG1"
  }

  user_data = base64encode(file("${path.module}/user_data/user_data_EC2STG1.sh.tpl"))
}

resource "aws_instance" "EC2STG2" {
  instance_type               = "t2.micro"
  ami                         = var.ami
  iam_instance_profile        = aws_iam_instance_profile.stg_lab_instsance_profile.name
  key_name                    = var.keypair
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.MyPublicSN2.id
  security_groups             = [aws_security_group.MySG.id]
  private_ip                  = "10.40.2.10"

  tags = {
    Name = "EC2-STG2"
  }

  user_data = base64encode(file("${path.module}/user_data/user_data_EC2STG2.sh.tpl"))
}