provider "aws" {
  access_key = "xxxx ROOT ACCESS KEY XXXXXXX"
  secret_key = "XXXX ROOT SECRET KEY XXXXXXX"
  # U CAN FIND Under security credentials for root access and secret key
  region = "ap-south-1"  
}

resource "aws_iam_user" "user1" {
  name = "BABU"
}

resource "aws_iam_user" "user2" {
  name = "Pavan"
}

resource "aws_iam_user" "user3" {
  name = "Reddy"
}

resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_group_membership" "group_membership" {
  name = "sre"
  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
    aws_iam_user.user3.name,
  ]
  group = aws_iam_group.developers.name
}

