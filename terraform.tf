variable "ami_value" {
  description = "value for the ami"
}

variable "instance_type_value" {
  description = "value for the instance type"
}
variable "key_name_value" {
  description = "value for the key_name_value"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
    alias = "ap-south-1"    # alias are given when you want to create the infor form the multi reagions
    region = "ap-south-1"

}
provider "aws" {
     alias = "us-east-2"
    region = "us-east-2"
}

resource "aws_instance" "this" {
  ami                     = var.ami_value
  instance_type           = var.instacne_value
   key_name               = var.key_name_value
   provider               = "aws.us-east-2"  # aws. region name you have to give also in the resource level
}
resource "aws_instance" "this" {
  ami                     = var.ami_value
  instance_type           = "t2.micro"
   key_name               = "master.pem"
   provider               = "aws.us-east-2"
}

variable    "instance_type" {
    type    "string"
    default "t2.micro"
}
























