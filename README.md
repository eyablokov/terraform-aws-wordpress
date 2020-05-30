# terraform-aws-wordpress

Provisioning Bitnami AMI image with Terraform in AWS.

## Application versions

* Bitnami AMI: 5.3.2
* Terraform: 0.12.20

## Pre-requisites

* Amazon AWS account
* Amazon AWS access key
* Amazon `awscli` (optional)
* SSH key pair
* Terraform CLI

## Steps

* Clone repository locally:

  ```bash
  git clone git@gitlab.com:enperez/terraform-aws-wordpress.git
  cd terraform-aws-wordpress
  ```

* Update `access_key` and `access_secret` variables in `./config/aws-credentials` file.
* Update `public_key` variable in `./config/vars.tfvars` file.

* Initialize Terraform backend:

  ```bash
  terraform init
  ```

* Show Terraform Plan:

  ```bash
  terraform plan -var-file=config/vars.tfvars
  ```

* Apply Terraform Plan:

  ```bash
  terraform apply -var-file=config/vars.tfvars
  ```

## Access

### Admin console

* Get the public IP/DNS addresses from the `wordpress_public_ip` or `wordpress_public_dns` variables of the Terraform output.

* Access to the _wp-admin_ console at: `https://{server_address}/wp-admin`.

  User credentials are:
  > Username: user<br>
  > Password: Fetch the password from the instance log. Refer to: https://docs.bitnami.com/aws/faq/get-started/find-credentials/

*Note*: If the password is not available in the instance log, retreive it at `~/bitnami_credentials` file via SSH connection.

### SSH

Connect to `{server_address}`, using `bitnami` user and private key generated `{private_pair_key}`:

```bash
ssh -i {private_pair_key} bitnami@{server_address}
```

## How to remove

To uninstall the instance, destroy all resources with single Terraform command:

```bash
terraform destroy -var-file=config/vars.tfvars
```

## Additional documentation

Bitnami Wordpress stack: https://bitnami.com/stack/wordpress
