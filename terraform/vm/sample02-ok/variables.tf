variable "resource_group_name" {
  type        = string
  default     = "rg-app-b-temp"
}

variable "vnet_resource_group_name" {
  type        = string
  default     = "rg-connectivity-temp"
}

variable "subnet_name" {
  type        = string
  default     = "sn-main-temp-int"
}

variable "vnet_name" {
  type        = string
  default     = "vnet-main-temp"
}

variable "nsg_name" {
  type        = string
  default     = "nsg-int-temp"
}