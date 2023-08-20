resource "aws_instance" "testServer01" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "tf_kp"
  vpc_security_group_ids = ["sg-02376bcee1179ee24"]
  tags = {
    Name    = "testServer01"
    Project = "testProj01"
  }
}
