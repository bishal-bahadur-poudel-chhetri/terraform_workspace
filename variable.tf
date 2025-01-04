# variables.tf
variable "jenkins_ami_id" {
  
}
variable "jenkins_instance_type" {
  default = "t2.micro"
  
}
variable "sg_name" {
  description = "The name of the security group"
  type        = string
}
variable "ami_id" {
}
variable "instance_type" {
  
}


variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type        = list(object({
    cidr_block = string
    from_port  = number
    to_port    = number
    protocol   = string
  }))
}

variable "egress_rules" {
  description = "List of egress rules for the security group"
  type        = list(object({
    cidr_block = string
    from_port  = number
    to_port    = number
    protocol   = string
  }))
}


variable "instance_names" {
  description = "List of instance names"
  type        = list(string)
  default     = ["dev-instance-1", "dev-instance-2", "dev-instance-3"]
}