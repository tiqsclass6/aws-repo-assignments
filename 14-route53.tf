# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record

data "aws_route53_zone" "main" {
  name         = "theinternationalquietstorm.com"
  private_zone = false
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "theinternationalquietstorm.com"
  type    = "A"

  alias {
    name                   = aws_lb.web-server.dns_name
    zone_id                = aws_lb.web-server.zone_id
    evaluate_target_health = true
  }
}