provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "akila_s3_static_bucket" {
  bucket = var.site_domain
}


resource "aws_s3_bucket_public_access_block" "akila_s3_static_bucket" {
  bucket = aws_s3_bucket.akila_s3_static_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "akila_s3_static_bucket" {
  bucket = aws_s3_bucket.akila_s3_static_bucket.id

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_bucket_ownership_controls" "akila_s3_static_bucket" {
  bucket = aws_s3_bucket.akila_s3_static_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "akila_s3_static_bucket" {
  bucket = aws_s3_bucket.akila_s3_static_bucket.id

  acl = "public-read"
  depends_on = [
    aws_s3_bucket_ownership_controls.akila_s3_static_bucket,
    aws_s3_bucket_public_access_block.akila_s3_static_bucket
  ]
}

resource "aws_s3_bucket_policy" "akila_s3_static_bucket" {
  bucket = aws_s3_bucket.akila_s3_static_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject","s3:PutObject"]
        Resource = [
          aws_s3_bucket.akila_s3_static_bucket.arn,
          "${aws_s3_bucket.akila_s3_static_bucket.arn}/*",
        ]
      },
    ]
  })

  depends_on = [
    aws_s3_bucket_public_access_block.akila_s3_static_bucket
  ]
}
resource "aws_s3_object" "object" {
  bucket = "akila-s3-static-bucket"
  key = "index.html"
  source = "./html/index.html"
  content_type = "text/html"
}

