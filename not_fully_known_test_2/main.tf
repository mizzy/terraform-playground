locals {
  users = [
    "foo",
    "bar",
  ]
}

resource "aws_iam_user" "users" {
  for_each = toset(local.users)
  name     = each.value
}

resource "aws_iam_user_policy" "policies" {
  for_each = toset(local.users)
  user     = aws_iam_user.users[each.value].name
  policy   = data.aws_iam_policy_document.documents[each.value].json
}

data "aws_iam_policy_document" "documents" {
  for_each = toset(local.users)
  statement {
    actions = [
      "iam:*",
    ]
    resources = [
      aws_iam_user.users[each.value].arn,
    ]
  }
}
