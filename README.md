# terraform-aws-loadbalancer

![CI Terraform](https://github.com/benniemosher-dev/terraform-aws-loadbalancer/actions/workflows/ci-terraform.yml/badge.svg)

⚖️ A TF module for AWS loadbalancers. ⚖

## 📜 Usage:

- To install dependencies needed run:
  ```bash
  brew bundle install
  ```
- To initialize Terraform in this folder:
  ```bash
  task infra:init
  ```
- To update modules and providers in this folder:
  ```bash
  task init -- -upgrade
  ```
- To validate the module in this folder:
  ```bash
  task infra:validate
  ```
- To plan the infrastructure in this folder:
  ```bash
  task infra:plan
  ```
- To plan specific resources of infrastructure in this folder:
  ```bash
  task infra:plan -- -target='cloudflare_record.this'
  ```

### 🆒 Extras:

- To find all the automation available in this folder:
  ```bash
  task --list-all
  ```
- To estimate the cost of the infrastructure in this folder:
  ```bash
  task infra:cost
  ```
- To update the documentation in this folder:
  ```bash
  task infra:docs
  ```
- To lint the Terraform in this folder:
  ```bash
  task infra:lint
  ```
- To validate security in this folder:
  ```bash
  task infra:sec
  ```

## 📋 Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.40 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.load-balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.http-ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.https-ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | The config to create the Load Balancer with. | <pre>object({<br>    allowed-ingress-cidrs = list(string)<br>    certificate           = optional(string, null)<br>    cluster-name          = string<br>    load-balancer-type    = optional(string, "application")<br>    subnets               = list(string)<br>    vpc                   = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs-security-group"></a> [ecs-security-group](#output\_ecs-security-group) | The security group ID for the ECS service to use. |
| <a name="output_load-balancer-dns"></a> [load-balancer-dns](#output\_load-balancer-dns) | The Load Balancer DNS name to reach the deployed web app. |
| <a name="output_load-balancer-target-group"></a> [load-balancer-target-group](#output\_load-balancer-target-group) | The target group for the load balancer. |
<!-- END_TF_DOCS -->
