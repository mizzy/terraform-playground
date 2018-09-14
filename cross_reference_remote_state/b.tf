resource "aws_iam_instance_profile" "test" {
  name  = "test"
  role = "${aws_iam_role.test.name}"
} 

resource "aws_iam_role" "test" {
    name = "test_role"
    assume_role_policy = "${data.aws_iam_policy_document.test.json}"
 }
