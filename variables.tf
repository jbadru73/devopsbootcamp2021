variable "ssh_key" {
  description = "This is used for tagging the instance"
  default     = "GeneralKP"
}

variable "instance_type" {
  description = "This is used for tagging the instance"
  default     = "t2.micro"
}

variable "image_id" {
  description = "This is used for tagging the instance"
  default     = "ami-02b4e72b17337d6c1"
}

variable "tag_name" {
  description = "This is used for tagging the instance"
  default     = "webserver250"
}

variable "bucket" {
  default     = "tegah-training-1"
}

variable "key" {
  default     = "training/git_managed/demo-statefile"
}

