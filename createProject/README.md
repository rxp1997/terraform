Project to enable project APIs and StackDriver export to PubSub in a project

MISSING: need to add folder & billing account

Update gcp.tfvars
```terraform
project_id = "project_id"
credentials = "<path-to-credentials-file>"
```

To Apply
```terraform
terraform apply -parallelism=1 -var-file="gcp.tfvars"
```
