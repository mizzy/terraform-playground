resource "aws_acm_certificate" "recruit_mizzy_org" {
  domain_name       = "recruit.mizzy.org"
  validation_method = "EMAIL"

  lifecycle {
    create_before_destroy = true
  }
}

