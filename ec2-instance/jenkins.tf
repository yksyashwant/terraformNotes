#use data source eto get a registered amazon linux 2 ami
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

#launch the ec2 instance and install website 
resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"
  subnet_id              = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  key_name               = "mac"
  #user_data = file(install_jenkins.sh)
  tags = {
    Name = "jenkins server"
  }
}
# an empty resource block 
resource "null_resource" "name" {

  #ssh into the ec2 instance
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("mac.pem")
    host        = aws_instance.ec2_instance.public_ip
  }

  #copy the Install_jenkins.sh file to ec2 instance 
  provisioner "file" {
    source      = "install_jenkins.sh"
    destination = "/tmp/install_jenkins.sh"

  }
  #seet permission and run the install_jenkins.sh file
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/install_jenkins.sh",
      "sh /tmp/install_jenkins.sh",

    ]

  }
  #wait for ec2 to create
  depends_on = [aws_instance.ec2_instance]

}

#print the url of the jenkins seerver

output "website_url" {
  value = join("", ["http://", aws_instance.ec2_instance.public_dns, ":", "8080"])

}


