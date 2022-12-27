resource "aws_route53_record" "component" {
  zone_id = "Z040913627YDP2ZIGZP4C"
  name    = "$(var.COMPONENT).roboshop.internal"
  type    = "A"
  ttl     = 300
  records = [aws_spot_instance_request.cheap_worker.private_ip]
}