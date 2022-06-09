provider "scaleway" {
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
  project_id = var.ORGANIZATION_ID
  zone       = var.zone
  region     = var.region
}
