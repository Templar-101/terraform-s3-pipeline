terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "project_bucket" {
  bucket = "henry-project1-${random_id.bucket_id.hex}"

  tags = {
    Environment = "Production"
    Owner       = "Henry"
  }
}
