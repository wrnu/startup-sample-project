terraform {
  source = "${path_relative_from_include()}/../terraform/aws"

  after_hook "gen" {
    commands = ["terragrunt-read-config"]
    execute  = ["python3", "${get_parent_terragrunt_dir()}/test.py"]
  }
}

locals {
  tfc_hostname     = "app.terraform.io"
  tfc_organization = "bcgov"
  project          = "tnfhhm"
  environment      = reverse(split("/", get_terragrunt_dir()))[0]
  client_app_image = get_env("client_app_image_${local.environment}", "")
}

generate "remote_state" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  backend "remote" {
    hostname = "${local.tfc_hostname}"
    organization = "${local.tfc_organization}"
    workspaces {
      name = "${local.project}-${local.environment}"
    }
  }
}
EOF
}

generate "tfvars" {
  path              = "terragrunt.auto.tfvars"
  if_exists         = "overwrite"
  disable_signature = true
  contents          = <<-EOF
client_app_image = "${local.client_app_image}"
EOF
}
