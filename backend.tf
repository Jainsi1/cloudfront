terraform {
  backend "s3"{
     bucket = "jainsi-statebucket"
     key = "jainsi-cloudfront-dev1/terraform.tfstate"
     region = "eu-central-1"
  }
}
