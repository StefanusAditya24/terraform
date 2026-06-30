resource "aws_launch_template" "web" {

  name_prefix = "web-template"

  image_id = var.ami_id

  instance_type = var.instance_type

  user_data = base64encode(file("userdata.sh"))

  network_interfaces {

    associate_public_ip_address = true

    security_groups = [
      aws_security_group.ec2_sg.id
    ]

  }

}