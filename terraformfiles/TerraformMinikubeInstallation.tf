provider "aws" {
 region = "us-east-1"
 access_key= "AKIAX7Q7633SUWPTMFBU"
 secret_key= "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"
}
resource "aws_instance" "demo-server" {
 ami = "ami-007855ac798b5175e"
 instance_type = "t2.medium"
 availability_zone = "us-east-1a"
 vpc_security_group_ids = ["sg-0185593602cd18eb2"]
 key_name = "mykey"
 tags = {
 name = "kubernetes_instance"
 }
 provisioner "remote-exec" {
 inline = [
 "curl -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl",
 "sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl",
 "chmod +x kubectl",
 "mkdir -p ~/.local/bin",
 "mv ./kubectl ~/.local/bin/kubectl",
 "sudo kubectl version --client",
 "sudo apt update",
 "sudo apt install docker.io -y",
 "curl https://github.com/kubernetes/minikube/releases/download/v1.21.0/minikube-linux-amd64",
 "curl -LO https://github.com/kubernetes/minikube/releases/download/v1.21.0/minikube-linux-amd64",
 "sudo install minikube-linux-amd64 /usr/local/bin/minikube",
 "sudo apt install conntrack",
 "sudo minikube start --driver=none"
 ]
}
 connection {
      type = "ssh"
      user = "ubuntu"
      host =  self.public_ip
      private_key = file("C:/mykey.pem")
      }
}
