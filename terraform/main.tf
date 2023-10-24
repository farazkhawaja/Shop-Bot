resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}



resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  kubernetes_version  = "1.28.0"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                = "system"
    node_count          = var.agent_count
    vm_size             = "Standard_DS2_v2"
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = false
  }
 

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet" 
  }
  
  
}
provider "kubernetes" {
  config_path = "~/.kube/config" # Path to your kubeconfig file
}

resource "kubernetes_namespace" "prod" {
  metadata {
    name = "prod"
  }
}
resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}
