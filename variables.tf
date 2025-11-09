variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region where Cloud SQL will be created"
  type        = string
  default     = "europe-west3"
}

variable "google_credentials" {
  description = "GCP credentials in JSON format"
  type        = string
  sensitive   = true
}

variable "instance_name" {
  description = "Cloud SQL instance name"
  type        = string
  default     = "mysql-instance"
}

variable "tier" {
  description = "Machine type tier (e.g. db-f1-micro, db-custom-1-3840)"
  type        = string
  default     = "db-f1-micro"
}

variable "authorized_cidr" {
  description = "CIDR block allowed to connect (for example your IP)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "database_name" {
  description = "Database name to create"
  type        = string
  default     = "app_db"
}

variable "db_user" {
  description = "Database username"
  type        = string
  default     = "app_user"
}

variable "db_password" {
  description = "Database user password"
  type        = string
  sensitive   = true
}
