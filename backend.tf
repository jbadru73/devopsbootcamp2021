terraform {
  backend "s3" {
    bucket = "terraformmdl-training"
    key    = "terraformmdl-training/mymodules/ec2-statefile"
    region = "eu-west-1"
  }
}