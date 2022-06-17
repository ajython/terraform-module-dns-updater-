## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.5 |
| <a name="requirement_dns"></a> [dns](#requirement\_dns) | >= 3.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dns"></a> [dns](#provider\_dns) | 3.2.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns_updater"></a> [dns\_updater](#module\_dns\_updater) | ../../. | n/a |

## Resources

| Name | Type |
|------|------|
| [dns_a_record_set.name](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/resources/a_record_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `list` | <pre>[<br>  "example.com"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_a_records"></a> [dns\_a\_records](#output\_dns\_a\_records) | List All A records |
