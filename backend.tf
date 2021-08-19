terraform {
  backend "s3" {
    bucket = "tegah-training-1"
    key    = "training/git_managed/demo-statefile"
    region = "us-east-1"
  }

}