terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}
provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}
module "testingbytegah" {
  source = "./mymodules/ec2"

  instancecount = 1
  ami_id        = "ami-02b4e72b17337d6c1"
  key           = "GeneralKP"
  instance_type = "t2.micro"
  name          = "toolbox module"
  httport       = 80
}

module "testingbytegah1" {
  source = "./mymodules/ec2"

  instancecount = 2
  ami_id        = "ami-02b4e72b17337d6c1"
  key           = "GeneralKP"
  instance_type = "t2.micro"
  name          = "changeable module"
  httport       = 80
}

/* resource "aws_instance" "web_server" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = var.ssh_key
  user_data              = data.template_file.ec2_user_data.template
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  count                  = var.instance_count
  tags = {
    Name = element(var.tag_name, count.index)
  }
}
 */
