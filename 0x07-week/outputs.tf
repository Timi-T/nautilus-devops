output "public_ip" {
  description = "Public ip of ec2 instace"
  value = try(aws_instance.cicd-infra.public_ip, "")
}