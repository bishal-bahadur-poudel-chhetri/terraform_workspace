resource "aws_vpc" "main" {
    cidr_block = local.selected_cidr.vpc 
    tags = {
      Name = "${local.workspace}-vpc"
    }
}


