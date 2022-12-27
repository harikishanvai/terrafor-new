resource "aws_spot_instance_request" "cheap_worker" {
  ami                  = "data.aws.ami.image.id"
  instance_type        = "t3.micro"
  wait_for_fulfillment = true
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = "var.COMPONENT"
  }
}

provisioner "remote-exec" {
  connection {
    host     = self.public_ip
    user     = "centos"
    password = "DevOps321"
  }
  inline  {
    "ansble-pull -u https://github.com/raghudevops63/ansible roboshop.yml -e HOST -e role_name=$(var.COMPONENT) -e APP_VERSION=$(var.APP_VERSION)"
  }
}