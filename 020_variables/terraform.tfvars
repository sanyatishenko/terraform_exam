/*
Terraform loads variables in the following order, 
with later sources taking precedence over earlier ones:

> Environment variables
> terraform.tfvars file, if present.
> terraform.tfvars.json file, if present.
> Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
> Any -var and -var-file options on the command line, in the order they are provided. 

*/




# Environment varialbes begin from TF_VAR_* :
# export TF_VAR_region='eu-central-1'   # for Unix system
# set TF_VAR_region='eu-central-1'      # for Windows system cmd
# $env:TF_VAR_region='eu-central-1'     # for Windows system powershell


# terraform.tfvars varialbes:
tags = {
  "Name"    = "Test EC2",
  "Project" = "Variables"
}


# Options on the command line
# terraform apply -var-file="testing.tfvars"
# terraform apply -var="region=us-east-1"