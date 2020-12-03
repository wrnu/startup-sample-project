# Sample Startup Project

[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://github.com/bcgov/repomountie/blob/master/doc/lifecycle-badges.md)

## A starter greeting template for cloud demo deployments

It's essentially a fancier "Hello World" app. This demo app is current WIP and not to be considered a reference architecture yet. The Cloud Pathfinder team intends to provide a proper CI/CD pattern and clean up rough edges. For now it has been used internally for testing purposes. Stay tuned we intend to have this improved soon.

---

## Introduction

Welcome to your new project. This is a basic starter project with a NodeJS app connected to a database for you to modify and expand to fit your needs. It provides scripts for developing and running locally.

## Prerequisites

In order to develop or run the app locally, you will need:

- a `bash`-like terminal environment; testing has primarily been done using MacOS Catalina, Ubuntu Linux, and Windows 10 (WSL2)
- `make`
- `Docker`

## Setup

### Install Prerequisites

```bash
# MacOS and Ubuntu 20.04, Windows 10 (WSL2 - Ubuntu 20.04), if make is installed
make local-setup
```

```bash
# MacOS, if make is not installed
./.config/local/darwin.sh
```

```bash
# Ubuntu 20.04, Windows 10 (WSL2 - Ubuntu 20.04), if make is not installed
./.config/local/linux.sh
```

### One-time Setup

```bash
# setup development environment
make setup-development-env
```

### Build and Run Locally using Docker

```bash
make local
```

### VS Code

```bash
# initialize vscode project config
make vscode-copy-config
```

```bash
# open the project in vscode
make vscode
```

## Deploying to AWS

To deploy to an AWS workload account see the [startup-sample-project-infrastructure](https://github.com/bcgov/startup-sample-project-infrastructure) repository.

## License

Copyright 2020 Province of British Columbia

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
