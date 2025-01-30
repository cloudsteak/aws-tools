# AWS Tools

This repository collects useful scripts and solutions for AWS.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Tools](#tools)
  - [ECR](#ecr)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Welcome to the AWS Tools repository. This collection includes various scripts and solutions to help you manage and automate your AWS infrastructure.

## Installation

To get started, clone the repository to your local machine:

```bash
git clone https://github.com/cloudsteak/aws-tools.git
```

## Usage

Each script and solution is located in its respective directory. Refer to the README files within each directory for detailed usage instructions.

## Tools

### ECR

Tools for ECR (Elastic Container Registry).

**Get ECR Lifecycle Policy**

Get all ECR repositories and their lifecycle policies, then exportthe data to json and txt file.

```bash
cd ecr

./getLifecyclePolicies.sh
```

Results are saved in `ecr/livecycle_policy.json` and `ecr/no_policy.txt`.

```bash
1/5. Checking repository: cs-aws-tools
2/5. Checking repository: cs-django-aws
3/5. Checking repository: cs-fastapi-aws
4/5. Checking repository: cs-go-aws
5/5. Checking repository: cs-python3-aws
Number of repositories with no policy: 1
Number of repositories with policy: 4
Result files: livecycle_policy.json, no_policy.txt
```

## Contributing

We welcome contributions! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
