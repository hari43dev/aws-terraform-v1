resource "aws_instance" "terraform-instance"{
    ami = "ami-0f5ee92e2d63afc18"
    instance_type = "t2.micro"

    tags = {
        Name = "terraform-instance"
    }

    key_name = "${aws_key_pair.key-tf.key_name}"
    vpc_security_group_ids = ["${aws_security_group.ssh-security-group.name}"]
}