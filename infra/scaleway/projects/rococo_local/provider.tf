terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "2.0.0"
    }
  }
}

provider "scaleway" {
  zone = "fr-par-1" # Must be same as a zone where instances will be deployed(only in case with extended disks) Issue: https://github.com/scaleway/terraform-provider-scaleway/issues/795
  region = "fr-par" 
  access_key      = "ACCESS_KEY"
  secret_key      = "SECRET_KEY"
  project_id = "PROJECT_ID"
}
