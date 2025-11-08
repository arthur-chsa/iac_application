terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# ---- Cloud SQL MySQL Instance ----
resource "google_sql_database_instance" "mysql_instance" {
  name             = var.instance_name
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = var.tier  # Example: db-custom-1-3840 or db-f1-micro

    ip_configuration {
      # Public access example; for private IP, see note below
      ipv4_enabled = true
      authorized_networks {
        name  = "home-access"
        value = var.authorized_cidr
      }
    }

    backup_configuration {
      enabled                        = true
      binary_log_enabled             = true
      start_time                     = "03:00"
    }

    maintenance_window {
      day          = 7  # Sunday
      hour         = 3
      update_track = "stable"
    }

    availability_type = "REGIONAL"
  }

  deletion_protection = false
}

# ---- Create a database ----
resource "google_sql_database" "app_db" {
  name     = var.database_name
  instance = google_sql_database_instance.mysql_instance.name
  charset  = "utf8mb4"
  collation = "utf8mb4_general_ci"
}

# ---- Create a user ----
resource "google_sql_user" "app_user" {
  name     = var.db_user
  instance = google_sql_database_instance.mysql_instance.name
  password = var.db_password
}