resource "aws_instance" "ec2_provision" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key
  count             = var.instancecount

  tags = {
    Name = "${var.name}-${count.index + 1}"
  }
}