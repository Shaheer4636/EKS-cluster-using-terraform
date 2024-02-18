resource "local_file" "main"{
filename = "/Terraform/main.tf"
content = "We love main file"
file_permission ="0700"

}