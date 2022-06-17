
/**
* # Terraform
*
# <Short TF module description>
# The DNS module is used to update and query DNS information on a DNS server. We need a provider config and resource config to be able to create/view DNS records on a DNS server. 
# There are several arguments in provider config which are optional and depending on the use can may or may not be used. These can be found at https://registry.terraform.io/providers/hashicorp/dns/latest/docs.  
# We for out use case only need server argument to define IP address of the DNS server. 

* ## Usage
#  1. A provider config is needed which tells terraform what provider to use. When initializing terraform, it installs required modules based on this provider. 
#  2. Create a resource config where we define our the relevant details for the resource we want to create. For instance, if we want to create a resource that creates A records, 
#     we need zone, name, addresses and ttl for it. 
#  3. To load files from a directory define path under local values section. In our case, we need to read input-json dir and ensure any new files which match the resource record format are added to the DNS server. 

* ### Quick Example

# CREATE PROVIDER CONFIG:

#  provider "dns" {
#    update {
#      server        = "127.0.0.1"
#      key_name      = "example.com."    # Optional
#      key_algorithm = "hmac-md5"         # Optional
#      key_secret    = "3VwZXJzZWNyZXQ="   # Optional
#    }
#  }

# CREATE RESOURCE CONFIG:

# resource "dns_a_record_set" "www" {
#   zone = "example.com."
#   name = "www"
#   addresses = [
#     "192.168.0.1",
#     "192.168.0.2"
#   ]
#   ttl = 300
# }
*/
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ---------------------------------------------------------------------------------------------------------------------
# SET TERRAFORM RUNTIME REQUIREMENTS
# ---------------------------------------------------------------------------------------------------------------------
# ------------------------------------------
# Write your local resources here
# ------------------------------------------

locals {
  source_data = fileset(path.root, "input-json/*.json")

}


# ------------------------------------------
# Write your Terraform resources here
# ------------------------------------------


resource "dns_a_record_set" "name" {
  for_each  = local.source_data
  zone = jsondecode(file(each.key))["zone"]
  name = trim(basename(each.key), "*.json")
  addresses = jsondecode(file(each.key))["addresses"]
  ttl = jsondecode(file(each.key))["ttl"]
}
