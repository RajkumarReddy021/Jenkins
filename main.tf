# Declare the AWS provider
provider "aws" {
  region = var.aws_region
}

# Declare variables
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"  # You can set a default value if desired
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-04e81358dc84d661d"  # Default AMI ID; replace with a valid one
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"  # Default instance type
}

variable "instance_name" {
  description = "Instance name"
  type        = string
  default     = "Server_1"  # Default instance name
}

# Create an AWS EC2 instance
resource "aws_instance" "created_by_terra" {  # Resource name stays the same
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name  # This sets the actual name of the instance in AWS
  }
}

# Optionally, you can define outputs
output "instance_id" {
  value = aws_instance.created_by_terra.id
}

output "public_ip" {
  value = aws_instance.created_by_terra.public_ip
}
