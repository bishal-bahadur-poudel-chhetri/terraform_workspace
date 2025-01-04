locals {
   workspace = terraform.workspace
  cidr_map = {
    "dev" = {
      vpc       = "10.0.0.0/16"
      public    = "10.0.1.0/24"
      private   = "10.0.2.0/24"
    }
    "prod" = {
      vpc       = "10.1.0.0/16"
      public    = "10.1.1.0/24"
      private   = "10.1.2.0/24"
    }
  }
   selected_cidr = local.cidr_map[local.workspace]

}

