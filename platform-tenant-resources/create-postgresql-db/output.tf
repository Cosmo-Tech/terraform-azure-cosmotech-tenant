output "out_postgres_release_name" {
  value = helm_release.postgresql.metadata.0.name
}