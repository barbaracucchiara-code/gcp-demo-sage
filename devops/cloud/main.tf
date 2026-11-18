resource "google_storage_bucket" "sage_docs" {
  name     = "${var.resource_prefix}-sage-docs"
  project  = var.project_id
  location = var.region

  # Permessi gestiti solo tramite IAM, non file per file
  uniform_bucket_level_access = true

  # Impedisce che il bucket diventi pubblico su Internet
  public_access_prevention = "enforced"

  # Permette a "terraform destroy" di cancellare il bucket anche se contiene file
  force_destroy = true
}

resource "google_storage_bucket" "sage_instructions" {
  name     = "${var.resource_prefix}-instructions"
  project  = var.project_id
  location = var.region

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = true
}

resource "google_storage_bucket_iam_member" "sage_run_instructions" {
  bucket = google_storage_bucket.sage_instructions.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.sage_run.email}"
}
