variable "REGION" {
  default = "us-west-2"
}

variable "ZONE1" {
  default = "us-west-2a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-west-2 = "ami-0e0f3d4588f992288" # Oregon us-west-2 - AWS Linux 2
    us-west-1 = "ami-019f33d94f416763f" # N.California us-west-1 - AWS Linux 2
  }
}
