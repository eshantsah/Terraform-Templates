variable "sg_ports" {

  type    = list(number)
  default = [1000, 2000, 3000, 4000, 5000]

}

resource "aws_security_group" "dyn_sg" {
  name = "dyn-sg-tf"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]


    }

  }

}
