resource google_sql_database_instance "master_instance" {
  name             = "terragoat-${var.environment}-master"
  database_version = "POSTGRES_11"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "WWW"
        value = "0.0.0.0/0"
      }
    }
    backup_configuration {
      enabled = false
    }
  }
}

resource google_bigquery_dataset "dataset" {
  dataset_id = "terragoat_${var.environment}_dataset"
  access {
    special_group = "allAuthenticatedUsers"
    role          = "READER"
  }
  labels = {
    git_commit           = "83661b5e88dd3768c10dbcfa2050c04d85b62fa8"
    git_file             = "terraform__gcp__big_data_tf"
    git_last_modified_at = "2020-07-09-13-34-36"
    git_last_modified_by = "nimrodkor"
    git_modifiers        = "nimrodkor"
    git_org              = "Fortiwatch"
    git_repo             = "terragoat"
    yor_name             = "dataset"
    yor_trace            = "132d2f52-e56c-4af4-a916-b309f56c9d47"
  }
}