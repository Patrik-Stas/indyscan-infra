resource "aws_instance" "indyscan" {
  ami = var.ubuntu_ami
  instance_type = var.ec2_size
  availability_zone = var.availability_zone
  key_name = var.keypair_name
  vpc_security_group_ids = flatten([
    aws_security_group.Indyscan_General.id,
    aws_security_group.Indyscan_Services.id,
    var.custom_security_group_ids
  ])

  root_block_device {
    volume_size = "100"
  }

  tags = {
    Name = var.ec2_tag
  }
}

resource "null_resource" "assure_software" {

  connection {
    type = "ssh"
    user = "ubuntu"
    host = aws_instance.indyscan.public_ip
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    source = "${path.module}/scripts-docker"
    destination = "$HOME"
  }

  provisioner "remote-exec" {
    inline = [
      "set -ex",
      "chmod +x $HOME/scripts-docker/*.sh",
      "$HOME/scripts-docker/assure-docker.sh ||:",
    ]
  }

  provisioner "remote-exec" {
    inline = [
      // it's was happening quite often I had to rerun because of unclear issue in assure-docker.sh
      // (usuall it still wouldn't find docker-ce even after repo was added), so this is dirtyfix. Just rerun once more
      // TODO: must be nice if we stabilize assuer-docker.sh so we could delete this remote-exec
      "$HOME/scripts-docker/assure-docker.sh",
      "rm -r \"$HOME/scripts-docker\"",
    ]
  }
}
