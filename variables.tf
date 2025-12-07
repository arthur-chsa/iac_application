variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "google_credentials" {
  type        = string
  description = "GCP credentials JSON"
  sensitive   = true
}

variable "instance_name" {
  type        = string
  description = "Cloud SQL instance name"
}

variable "tier" {
  type        = string
  description = "Cloud SQL machine tier (e.g., db-custom-1-3840, db-f1-micro)"
}

variable "authorized_cidr" {
  type        = string
  description = "CIDR block authorized for database access"
}

variable "database_name" {
  type        = string
  description = "Database name"
}

variable "db_user" {
  type        = string
  description = "Database user name"
}

variable "db_password" {
  type        = string
  description = "Database user password"
  sensitive   = true
}
