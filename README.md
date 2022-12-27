<a name="readme-top"></a>

<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![Workflow][workflow-shield]][workflow-url]

# terraform-module

🧱 A Terraform module template repo 🧱

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

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3  |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.

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
