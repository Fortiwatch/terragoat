data google_compute_zones "zones" {}

resource google_compute_instance "server" {
  machine_type = "n1-standard-1"
  name         = "terragoat-${var.environment}-machine"
  zone         = data.google_compute_zones.zones.names[0]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
    auto_delete = true
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public-subnetwork.name
    access_config {}
  }
  can_ip_forward = true

  metadata = {
    block-project-ssh-keys = false
    enable-oslogin         = false
    serial-port-enable     = true
  }
  labels = {
    git_commit           = "37914a45800114d263c0dcd74b81b9dd01307e13"
    git_file             = "terraform__gcp__instances_tf"
    git_last_modified_at = "2020-07-09-13-43-30"
    git_last_modified_by = "nimrodkor"
    git_modifiers        = "nimrodkor"
    git_org              = "Fortiwatch"
    git_repo             = "terragoat"
    yor_name             = "server"
    yor_trace            = "b0126414-4d5f-48c7-b723-0581c7d04b6d"
  }
}

resource google_compute_disk "unencrypted_disk" {
  name = "terragoat-${var.environment}-disk"
  labels = {
    git_commit           = "83661b5e88dd3768c10dbcfa2050c04d85b62fa8"
    git_file             = "terraform__gcp__instances_tf"
    git_last_modified_at = "2020-07-09-13-34-36"
    git_last_modified_by = "nimrodkor"
    git_modifiers        = "nimrodkor"
    git_org              = "Fortiwatch"
    git_repo             = "terragoat"
    yor_name             = "unencrypted_disk"
    yor_trace            = "c5c20e0c-e4cd-4af6-8989-b792618f72b6"
  }
}