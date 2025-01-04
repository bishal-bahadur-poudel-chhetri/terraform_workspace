
jenkins_ami_id="ami-0e2c8caa4b6378d8c"
jenkins_instance_type="t2.micro"

instance_names = ["kube-master","kube-worker"]
ami_id = "ami-0e2c8caa4b6378d8c"
instance_type = "t2.medium"
# prod.tfvars

sg_name = "dev-sg"
ingress_rules = [
  {
    cidr_block = "0.0.0.0/0" 
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
  },
  {
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
  }
]

egress_rules = [
  {
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
  }
]
