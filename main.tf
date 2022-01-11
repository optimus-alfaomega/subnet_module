terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws" {
 
 region = var.region
 access_key= var.access_key
 secret_key= var.secret_key
 
}


resource "aws_vpc" "main" {
  cidr_block = var.cidr_block_def
  instance_tenancy = var.instance_tenancy_def
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}