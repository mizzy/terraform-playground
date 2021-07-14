resource "aws_instance" "test" {
  ami           = "ami-06b258aac2ae736c2" # Ubuntu 20.04
  instance_type = "t2.micro"
}

output "id" {
  value = aws_instance.test.id
}

