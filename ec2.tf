resource "aws_instance" "test" {
  ami                  = "ami-cbb259b4" # Ubuntu 16.04
  instance_type        = "t2.micro"
  key_name             = "aws_mizzy"
  security_groups      = ["all"]
  iam_instance_profile = "${data.terraform_remote_state.global_iam.aws_iam_instance_profile_test_name}"
}
