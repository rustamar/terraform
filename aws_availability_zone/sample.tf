variable "region_number" {
  # Arbitrary mapping of region name to number to use in
  # a VPC's CIDR prefix.
  default = {
    us-east-1      = 1
    us-west-1      = 2
    us-west-2      = 3
    eu-central-1   = 4
    ap-northeast-1 = 5
  }
}

variable "az_number" {
  # Assign a number to each AZ letter used in our configuration
  default = {
    a = 1
    b = 2
    c = 3
    d = 4
    e = 5
    f = 6
  }
}

# Retrieve the AZ where we want to create network resources
# This must be in the region selected on the AWS provider.
data "aws_availability_zone" "example" {
  name = "eu-central-1a"
}

# Create a VPC for the region associated with the AZ
output "aws_vpc_example" {
   value = "${cidrsubnet("10.0.0.0/8", 4, var.region_number[data.aws_availability_zone.example.region])}"
}

output "aws_subnet_example" {
  value = "${cidrsubnet(cidrsubnet("10.0.0.0/8", 4, var.region_number[data.aws_availability_zone.example.region]), 4, var.az_number[data.aws_availability_zone.example.name_suffix])}"
}

output "region_number" {
  value = "${var.region_number[data.aws_availability_zone.example.region]}"
}

output "az_number" {
  value = "${var.az_number[data.aws_availability_zone.example.name_suffix]}"
}


