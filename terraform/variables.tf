variable "agent_count" {
  default = 2
}

# The following two variable declarations are placeholder references.
# Set the values for these variable in terraform.tfvars
variable "aks_service_principal_app_id" {
  default = ""
}

variable "aks_service_principal_client_secret" {
  default = ""
}

variable "admin_username" {
  default = "demo"
}

variable "cluster_name" {
  default = "k8s-cluster"
}

variable "dns_prefix" {
  default = "demok8s"
}

variable "resource_group_location" {
  default     = "EAST US"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "demo-terraform-kubernetes-RG"
  description = "Resource group name that is unique in your Azure subscription."
}