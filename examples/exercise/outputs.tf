# ----------------------------------------
# Write your Terraform module outputs here
# ----------------------------------------

output "dns_a_records" {
    description = "List All A records"
    value = {for k, v in dns_a_record_set.name: trim(basename(k), "*.json" )=> v.addresses}

}