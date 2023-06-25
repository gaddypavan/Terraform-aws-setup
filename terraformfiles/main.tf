provider "aws" {
    region = "ap-south-1"
    access_key = "AKIA5J6IGUZMB2Z5IMJE"
    secret_key = "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"
}

resource "aws_s3_bucket" "gpavankumarreddy12345" {
  bucket = "babureddy28734099gmail"

  tags = {
    Name        = "My_bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "object11" {
  bucket = "babureddy2812734gmail"
  key    = "hello.txt"
  source = "C:/s3bucket/s3/hello.txt"
}