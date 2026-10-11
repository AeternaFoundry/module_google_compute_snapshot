variable "compute_snapshots" {
  description = <<EOT
Map of compute_snapshots, attributes below
Required:
    - name
Optional:
    - chain_name
    - deletion_policy
    - description
    - labels
    - project
    - snapshot_type
    - source_disk
    - source_instant_snapshot
    - storage_locations
    - zone
    - params (block):
        - resource_manager_tags (optional)
    - snapshot_encryption_key (block):
        - kms_key_self_link (optional)
        - kms_key_service_account (optional)
        - raw_key (optional)
        - rsa_encrypted_key (optional)
    - source_disk_encryption_key (block):
        - kms_key_self_link (optional)
        - kms_key_service_account (optional)
        - raw_key (optional)
        - rsa_encrypted_key (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name                    = string
    chain_name              = optional(string)
    deletion_policy         = optional(string)
    description             = optional(string)
    labels                  = optional(map(string))
    project                 = optional(string)
    snapshot_type           = optional(string)
    source_disk             = optional(string)
    source_instant_snapshot = optional(string)
    storage_locations       = optional(list(string))
    zone                    = optional(string)
    params = optional(object({
      resource_manager_tags = optional(map(string))
    }))
    snapshot_encryption_key = optional(object({
      kms_key_self_link       = optional(string)
      kms_key_service_account = optional(string)
      raw_key                 = optional(string)
      rsa_encrypted_key       = optional(string)
    }))
    source_disk_encryption_key = optional(object({
      kms_key_self_link       = optional(string)
      kms_key_service_account = optional(string)
      raw_key                 = optional(string)
      rsa_encrypted_key       = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

