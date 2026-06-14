# tf_moris_sbx
Create the MoRIS Sandbox environment.

# Prepare
## Devcontainer
Create a file **devcontainer.env** in the **.devcontainer** folder, which includes the necessary environment variables:
- BTP_USERNAME
- BTP_PASSWORD
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

## Variables
Create a file **terraform.tfvars** with the following varabels and maintain the correct values in it.
| Variable | Description |
| --- | --- |
| global_account | ID of the subaccount to be trusted. |
| project_name | Name of the project, this terraform script belongs to. The project name is used to derife the subaccount name from it. |  
| btp_idp | FQDN of the Identity Provider (IdP) to be trusted. |
| btp_platform_idp | FQDN of the platform Identity Provider (IdP). |
| subaccount_region | The data center region, the subaccount shall be created in. (e.g. "eu10", "eu11", "eu20", "eu22", "eu30", "eu31) |
| stage | The development stage, the subaccount belongs to. (e.g. "SBX", "DEV", "QAS", "PRD") |
| parent_id | The UUID of the directory, the subaccount shall be created in. |

# Run
Run the following terraform commands in an terminal within the devcontainer:
```shell
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
````
