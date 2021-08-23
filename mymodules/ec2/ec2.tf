resource "aws_instance" "ec2_provision" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key
  instance_count    = var.instance_count

  tags = {
    Name = var.name
  }
}