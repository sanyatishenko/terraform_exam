terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 3.0"
    }
  }
}


provider "aws" {
  region = "eu-central-1"
}

/*
config file for TerraformCLI
windows:    $env:APPDATA\terraform.rc
linux:      ~/.terraformrc

Path to config file can be canged 
export TF_CLI_CONFIG_FILE="/new/path"

Offline providers cache (the directory must be created):
plugin_cache_dir   = "$HOME/.terraform.d/plugin-cache"

# export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
*/


