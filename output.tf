output "instance-public-ip" {
  value = "please connect using ssh -i yourkey ec2-user@${aws_instance.web_server.public_ip}"
}