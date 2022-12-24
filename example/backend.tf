terraform {
  backend "s3" {
    bucket = "terraform-hk63"
    key    = "example/terraform.tfstate"
    region = "us-east-1"
  }
}