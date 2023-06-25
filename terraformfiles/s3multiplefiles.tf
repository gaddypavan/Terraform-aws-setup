provider "aws" {
    region = "ap-south-1"
    access_key = "AKIA5J6IGUZMH2GUKFUY"
    secret_key = "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"
}

resource "aws_s3_bucket" "gpavankumarreddy1" {
  bucket = "babureddy28734gmail"

  tags = {
    Name        = "My_bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "object" {
  bucket = "babureddy28734gmail"
  key    = "hello.txt"
  source = "C:/s3bucket/s3/hello.txt"
}

resource "null_resource" "multiple" {
  provisioner "local-exec" {
    command = "aws s3 sync C:/Users/DELL/Documents/Visual Studio 2010/Settings s3://babureddy28734gmail"
  }
}