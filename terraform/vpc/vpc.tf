resource "aws_vpc" "test_vpc" {
  count = 2
  cidr_block = var.cidr_block
  tags = {
    name = "test_vpc1"
  }
}

resource "aws_subnet" "subnet" {
  cidr_block = "18.0.0.0/16"
  vpc_id     = aws_vpc.test_vpc.id
}
output "vpc_tag" {
  value = aws_vpc.test_vpc.*.tags
}