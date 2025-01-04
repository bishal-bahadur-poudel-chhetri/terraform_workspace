resource "aws_internet_gateway" "igw" {
    vpc_id =  aws_vpc.main.id
    tags = {
            type = "${local.workspace}-IGW"
        }  
}

resource "aws_route_table" "public-route" {
    vpc_id = aws_vpc.main.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}


resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = local.selected_cidr["public"]
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
    tags = {
      Name = "${local.workspace}-public-subnet"
    }
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    cidr_block = local.selected_cidr["private"]
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
    tags = {
      Name = "${local.workspace}-private-subnet"
    }
}

resource "aws_route_table_association" "public_association" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public-route.id
}


# sg.tf

resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Security group for the app"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      cidr_blocks = [ingress.value.cidr_block]
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      cidr_blocks = [egress.value.cidr_block]
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
    }
  }

  tags = {
    Name = "app-sg"
  }
}
