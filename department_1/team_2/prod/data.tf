#############
# Gather info about the vDC-Group
#############
data "vcd_vdc_group" "vdc_group" {
  name = var.vdc_group_name
}

#############
# Gather info about the Edge-Gateway
#############
data "vcd_nsxt_edgegateway" "nsxt_edgegateway" {
  name     = var.vdc_edge_gateway_name
  owner_id = data.vcd_vdc_group.vdc_group.id
}

#############
# Gather info about vApp-Templates in the Catalog
#############
data "vcd_catalog" "catalog" {
  name = "images"
  org  = "Catalog"
}

data "vcd_catalog_vapp_template" "noris-Windows_Server_2025_Standard_English_vDC" {
  name       = "noris-Windows Server 2025 Standard English vDC"
  catalog_id = data.vcd_catalog.catalog.id
}

#############
# Gather info about Org-Networks
#############
data "vcd_network_routed_v2" "PROD-NET" {
  edge_gateway_id = data.vcd_nsxt_edgegateway.nsxt_edgegateway.id
  name            = "PROD-NET"
}
