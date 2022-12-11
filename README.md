<a name="readme-top"></a>

<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![Workflow][workflow-shield]][workflow-url]

# terraform-aws-loadbalancer

⚖️ A TF module for AWS loadbalancers. ⚖

[Explore the docs](https://github.com/benniemosher-dev/terraform-module) |
[View Demo](https://github.com/benniemosher-dev/terraform-module) |
[Report Bug](https://github.com/benniemosher-dev/terraform-module/issues) |
[Request Feature](https://github.com/benniemosher-dev/terraform-module/issues)

</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ul>
    <li><a href="#todo">✅ TODO</a></li>
    <li>
      <a href="#usage">📜 Usage</a>
      <ul>
        <li><a href="#extras">🆒 Extras</a></li>
      </ul>
    </li>
    <li><a href="#documentation">📋 Documentation</a></li>
  </ul>
</details>

## ✅ TODO:

Things to change when first creating a module:

- [ ] In `README.md` change `terraform-module` to the name of this module (i.e. `terraform-cloudflare-record`)
- [ ] In `README.md` find/replace instances of `benniemosher-dev` and `terraform-module`
- [ ] In `.github/workflows/ci-terraform.yml` delete lines 13-14 enabling cost
- [ ] In `README.md` delete the [TODO](README.md#todo) section

([back to top](#readme-top))

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

([back to top](#readme-top))

## 📋 Documentation

### Built With

[![Terraform][terraform-shield]][terraform-url]
[![AWS][aws-shield]][aws-url]

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
| [aws_security_group_rule.service-ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

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

([back to top](#readme-top))

[aws-shield]: https://img.shields.io/badge/aws-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white
[aws-url]: https://aws.amazon.com/
[contributors-shield]: https://img.shields.io/github/contributors/benniemosher-dev/terraform-module.svg?style=for-the-badge
[contributors-url]: https://github.com/benniemosher-dev/terraform-module/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/benniemosher-dev/terraform-module.svg?style=for-the-badge
[forks-url]: https://github.com/benniemosher-dev/terraform-module/network/members
[issues-shield]: https://img.shields.io/github/issues/benniemosher-dev/terraform-module.svg?style=for-the-badge
[issues-url]: https://github.com/benniemosher-dev/terraform-module/issues
[license-shield]: https://img.shields.io/github/license/benniemosher-dev/terraform-module.svg?style=for-the-badge
[license-url]: https://github.com/benniemosher-dev/terraform-module/blob/master/LICENSE.txt
[stars-shield]: https://img.shields.io/github/stars/benniemosher-dev/terraform-module.svg?style=for-the-badge
[stars-url]: https://github.com/benniemosher-dev/terraform-module/stargazers
[terraform-shield]: https://img.shields.io/badge/terraform-844fba?style=for-the-badge&logo=terraform&logoColor=white
[terraform-url]: https://www.terraform.io/
[workflow-shield]: https://img.shields.io/github/actions/workflow/status/benniemosher-dev/terraform-module/ci-terraform.yml?logo=github&style=for-the-badge
[workflow-url]: https://github.com/benniemosher-dev/terraform-module/actions/workflows/ci-terraform.yml
