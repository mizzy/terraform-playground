terraform {
  backend "s3" {
    bucket = "tfstate.mizzy"
    key    = "flat.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "global_iam" {
  backend = "s3"
  config {
    bucket = "tfstate.mizzy"
    key = "global/iam.tfstate"
    region = "ap-northeast-1"
  }
}
