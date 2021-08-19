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

data "template_file" "ec2_user_data" {
  template = "${file("${path.module}/bootstrap.txt")}"
}
resource "aws_instance" "app_server" {
  ami           = "ami-02b4e72b17337d6c1"
  instance_type = "t2.micro"
  key_name      = "GeneralKP"
  user_data     = "${data.template_file.ec2_user_data.template}"

  tags = {
    Name = "WebServer101"
  }
}

terraform {
  backend "s3" {
    bucket = "tegah-training-1"
    key    = "training/git_managed/demo-statefile"
    region = "us-east-1"
  }

}