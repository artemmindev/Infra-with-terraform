resource "aws_s3_bucket" "image-bucket" {
  bucket = "artem-original-image-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "image-bucket-controls" {
  bucket = aws_s3_bucket.image-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "image-bucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.image-bucket-controls]

  bucket = aws_s3_bucket.image-bucket.id
  acl    = "private"
}