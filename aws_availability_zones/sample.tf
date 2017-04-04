
provider "aws" {
  region = "eu-central-1"
}

data "aws_availability_zones" "available" {}

output "aws_availability_zones_available" {
  value = "${data.aws_availability_zones.available.names}"
}
