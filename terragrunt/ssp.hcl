terraform {
  source = "${path_relative_from_include()}/../terraform/aws//."

  before_hook "python" {
    commands = ["plan"]
    execute  = ["python3", "${get_parent_terragrunt_dir()}/test.py"]
  }

  before_hook "bash" {
    commands = ["plan"]
    execute  = ["bash", "${get_parent_terragrunt_dir()}/test.sh"]
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
