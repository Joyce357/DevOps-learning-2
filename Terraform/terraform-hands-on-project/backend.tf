terraform {
  backend "s3" {
    bucket = "class10-terraform-statefile"
    key    = "class10/terraform.tfstate"
    region = "ca-central-1"
    
  }
}