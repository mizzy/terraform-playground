resource "aws_iam_instance_profile" "test" {
  name = "test"
  role = "${aws_iam_role.test.name}"
}

resource "aws_iam_role" "test" {
  name               = "test_role"
  assume_role_policy = "${data.terraform_remote_state.a.test-json}"
}
