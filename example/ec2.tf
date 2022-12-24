provider "aws" {
  region = "us-east-1"
}

output "public_ip" {
  value = aws_instance.sample.public_ip
}

