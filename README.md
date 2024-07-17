# secrets-manager-deploy
This is a basic terraform module for deploying a list of secrets to AWS Secrets Manager. 

The module expects that you already have the necessary AWS credentials configured using 
```
$ aws configure
```

## To Deploy Secrets
Run the following
```
$ terragrunt init
$ terragrunt apply
```


## Known Issues
* The list of secrets is currently hardcoded in cleartext as input in `terragrunt.hcl`.
  * In future iterations, this list can likely be passed more securely through the use of the `shared_credentials_files` setting.