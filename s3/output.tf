output "EC2STG1IP" {
  value = aws_instance.EC2STG1.public_ip
}

output "EC2STG2IP" {
  value = aws_instance.EC2STG2.public_ip
}

output "iam_permissions" {
  value = [aws_iam_role_policy_attachment.ec2_full_access.id,
    aws_iam_role_policy_attachment.s3_full_access.id,
  aws_iam_role_policy_attachment.ssm_instance_core.id]

  description = "List of Role with IAM"
}