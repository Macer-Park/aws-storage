resource "aws_iam_role" "stg_lab_instsance_role" {
  name = "STGLabInstanceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "STGLabInstanceRole"
  }

  path = "/"
}

resource "aws_iam_role_policy_attachment" "ssm_instance_core" {
  role       = aws_iam_role.stg_lab_instsance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "s3_full_access" {
  role       = aws_iam_role.stg_lab_instsance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "ec2_full_access" {
  role       = aws_iam_role.stg_lab_instsance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_instance_profile" "stg_lab_instsance_profile" {
  name = "STGLabInstanceProfile"
  role = aws_iam_role.stg_lab_instsance_role.name
  path = "/"
}