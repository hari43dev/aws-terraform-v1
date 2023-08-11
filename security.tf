resource "aws_security_group" "ssh-security-group" {
    name = "SSH security group"
    description = "This is an SSH security group for aws ec2 instance"

    tags = {
      Name = "SSH security group"
    }

    #ingress {
    #    description = "SSH access"
    #    from_port = 22
    #    to_port = 22
    #    protocol = "tcp"
    #    cidr_blocks = ["0.0.0.0/0"]
    #}

    dynamic "ingress" {
        for_each = [22,80,8080,443,3306]
        iterator = port
        content {
            description = "TLS from VPC"
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }


    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }


}

