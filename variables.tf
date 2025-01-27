variable "environment" {
  description = "Specifies the environment name, such as dev, test, or prod."
  type        = string
  default     = "dev"
}

variable "default_tags" {
  description = "A map of tags to be applied to all resources for consistent metadata and management."
  type        = map(string)
  default = {
    "ManagedByTerraform" = "True"
  }
}

variable "region" {
  description = "The Azure region where resources will be deployed (e.g., 'weu' for West Europe)."
  type        = string
  default     = "weu"
}

variable "resource_group_location" {
  description = "The Azure region where the resource group exists. Modifying this will recreate the resource group."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group where the network security group will be created. Changing this triggers the recreation of the resource."
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group to be created."
  type        = string
}

variable "security_rules" {
  description = "A list of security rules to apply to the network security group. Each rule should be a map containing the required properties. Refer to the documentation for details."
  type        = list(map(string))
}
