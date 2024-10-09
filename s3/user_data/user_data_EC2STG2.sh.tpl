#!/bin/bash
hostnamectl --static set-hostname EC2-STG2
echo "sudo su -" >> /home/ec2-user/.bashrc
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install --bin-dir /usr/bin --install-dir /usr/bin --update           
yum install httpd tree tmux amazon-efs-utils -y
systemctl start httpd && systemctl enable httpd
echo "<html><h1>Storage LAB - Web Server 2</h1></html>" > /var/www/html/index.html
EC2_INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
ROOT_DISK_ID=$(aws ec2 describe-volumes --region ap-northeast-2 --filters Name=attachment.instance-id,Values=$EC2_INSTANCE_ID --query 'Volumes[*].[VolumeId]' --output text)
aws ec2 create-tags --resources $ROOT_DISK_ID --tags Key=Name,Value="EC2-STG2_Root_Volume"