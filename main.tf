provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Created_by_terra" {
  ami           = "ami-04e81358dc84d661d"  # Replace with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
