output "instance_connection_name" {
  description = "Cloud SQL connection string"
  value       = google_sql_database_instance.mysql_instance.connection_name
}

output "public_ip_address" {
  description = "Public IP of the SQL instance"
  value       = google_sql_database_instance.mysql_instance.public_ip_address
}
