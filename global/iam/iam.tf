resource "aws_iam_instance_profile" "test" {
  name = "test"
  role = "${aws_iam_role.test.name}"
}

resource "aws_iam_role" "test" {
  name               = "test_role"
  assume_role_policy = <<EOF
{   
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
            "ec2.amazonaws.com"
        ]   
      },
      "Action": "sts:AssumeRole"
    } 
  ] 
} 
EOF
}
