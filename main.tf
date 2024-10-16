provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-04e81358dc84d661d"  # Replace with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
