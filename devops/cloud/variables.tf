variable "project_id" {
  description = "ID del progetto GCP"
  type        = string
}

variable "region" {
  description = "Regione in cui creare le risorse"
  type        = string
}

variable "resource_prefix" {
  description = "Prefisso per i nomi delle risorse"
  type        = string
}
