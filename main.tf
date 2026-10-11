resource "google_compute_snapshot" "compute_snapshots" {
  for_each = var.compute_snapshots

  name                    = each.value.name
  chain_name              = each.value.chain_name
  deletion_policy         = each.value.deletion_policy
  description             = each.value.description
  labels                  = each.value.labels
  project                 = each.value.project
  snapshot_type           = each.value.snapshot_type
  source_disk             = each.value.source_disk
  source_instant_snapshot = each.value.source_instant_snapshot
  storage_locations       = each.value.storage_locations
  zone                    = each.value.zone

  dynamic "params" {
    for_each = each.value.params != null ? [each.value.params] : []
    content {
      resource_manager_tags = params.value.resource_manager_tags
    }
  }

  dynamic "snapshot_encryption_key" {
    for_each = each.value.snapshot_encryption_key != null ? [each.value.snapshot_encryption_key] : []
    content {
      kms_key_self_link       = snapshot_encryption_key.value.kms_key_self_link
      kms_key_service_account = snapshot_encryption_key.value.kms_key_service_account
      raw_key                 = snapshot_encryption_key.value.raw_key
      rsa_encrypted_key       = snapshot_encryption_key.value.rsa_encrypted_key
    }
  }

  dynamic "source_disk_encryption_key" {
    for_each = each.value.source_disk_encryption_key != null ? [each.value.source_disk_encryption_key] : []
    content {
      kms_key_self_link       = source_disk_encryption_key.value.kms_key_self_link
      kms_key_service_account = source_disk_encryption_key.value.kms_key_service_account
      raw_key                 = source_disk_encryption_key.value.raw_key
      rsa_encrypted_key       = source_disk_encryption_key.value.rsa_encrypted_key
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

