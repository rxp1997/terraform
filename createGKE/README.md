Terraform template to deploy Kubernetes Cluster

MISSING: standarizing on a cluster size/node specs

Create a gcp.tfvars
```terraform
project_id = "<project name>"
cluster_name = "<cluster name>"
credentials = "<path to credentials file>"
cluster_description = "<cluster descriptions>"
cluster_labels = {label1="foo", label2="bar"}
node_tags = ["tag1","tag2"]
```

To Apply
```terraform
terraform apply -parallelism=1 -var-file="gcp.tfvars"
```

To Test, this will deploy sample app and CURL against public endpoint to validate deployment
```terraform
./test-deployment.sh
```
```
