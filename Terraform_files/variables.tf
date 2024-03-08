variable "region" {
  default = "us-west-2"
}
variable "availability_zone" {
   type = list 
   default = ["us-west-2a","us-west-2b","us-west-2c"]
}

variable "project" {
  type=string
  default = "my-project"
}

variable "instance-type" {
    type= list 
    default = ["t2.micro","t2.medium","t2.large"]
  
}

