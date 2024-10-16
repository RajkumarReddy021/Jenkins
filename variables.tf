variable "key_name" {
    description = "The name of the SSH key pair to access the instance"
    type        = string
}

variable "access_key" {
    description = "AWS Access Key"
    type        = string
    sensitive   = true
}

variable "secret_key" {
    description = "AWS Secret Key"
    type        = string
    sensitive   = true
}

