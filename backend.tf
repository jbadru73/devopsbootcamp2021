terraform {
  backend "s3" {
    bucket = var.bucket
    key    = var.key
    region = "us-east-1"
  }

}