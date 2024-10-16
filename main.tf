provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region     = "ap-south-1"
}

resource "aws_instance" "first_instance" {
    ami                    = "ami-04e81358dc84d661d"
    availability_zone     = "ap-south-1a"
    instance_type         = "t2.micro"
    key_name              = var.key_name
    tags = {
        Name        = "first_instance"
        Department  = "devops"
        tools       = "Terraform"
    }
}

