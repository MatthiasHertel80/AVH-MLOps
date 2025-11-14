[![License](https://img.shields.io/github/license/Arm-Software/AVH-MLOPs?label)](https://github.com/Arm-Software/AVH-MLOPs/blob/main/LICENSE)
[![base_image_build](https://img.shields.io/github/actions/workflow/status/Arm-Software/AVH-MLOPs/base_image_build.yml?logo=arm&logoColor=0091bd&label=Base%20Image%20build)](https://github.com/Arm-Software/AVH-MLOPs/tree/main/.github/workflows/base_image_build.yml)
[![licensed_image_build](https://img.shields.io/github/actions/workflow/status/Arm-Software/AVH-MLOPs/licensed_image_build.yml?logo=arm&logoColor=0091bd&label=Licensed%20Image%20Build)](https://github.com/Arm-Software/AVH-MLOPs/tree/main/.github/workflows/licensed_image_build.yml)
[![licensed_image_build_community](https://img.shields.io/github/actions/workflow/status/Arm-Software/AVH-MLOPs/licensed_image_build_community.yml?logo=arm&logoColor=0091bd&label=Licensed%20Image%20Build%20Community)](https://github.com/Arm-Software/AVH-MLOPs/tree/main/.github/workflows/licensed_image_build_community.yml)
[![licensed_image_test](https://img.shields.io/github/actions/workflow/status/Arm-Software/AVH-MLOPs/licensed_image_test.yml?logo=arm&logoColor=0091bd&label=Licensed%20Image%20Test)](https://github.com/Arm-Software/AVH-MLOPs/tree/main/.github/workflows/licensed_image_test.yml)


# Foundation Components for MLOps Systems

Arm provides a set of foundation tools and software components to enable MLOps systems and the overall development flow for machine learning applications. 
- This repository contains workflows to create Docker containers with foundation tools for MLOps systems.


## Directory Structure

| <div style="width:280px">Directory </div>          | Description  |
|---                                                 |---           |
| [.github/workflows](./.github/workflows)           | GitHub Action workflow definitions. | 
| [docker_base](./docker_base)                       | Docker base image with all tools (see Arm Tools Artifactory). | 
| [docker_licensed](./docker_licensed)               | Import license file into the Docker base image. | 
| [local_build](./local_build)                       | Folder to build the container onto a desktop machine. |


## Continuous Integration (CI)

Four workflows examplify how to create docker images and equip with licenses suitable for build and test typical MLOps applications.

| <div style="width:280px"> CI Workflow files </div>                      | Description |
|---                                                                      |---  |
| [base_image_build.yml](.github/workflows/base_image_build.yml)          | Build a docker image that has all ARM tools mentioned before installed and configured. It will be stored on the Github docker registry for fast access to the image. |
| [licensed_image_build.yml](.github/workflows/licensed_image_build.yml)  | By using the Base docker image, this workflow adds your own license supplied by Arm for the commercial tools. It is rebuilt every night and serves as the base image from which the actual container runtime environments are generated. It will also be stored on the Github docker registry. |
| [licensed_image_test.yml](.github/workflows/licensed_image_test.yml)    | Test the licensed docker image with the necessary tools and dependencies for an ML project. |
| [licensed_image_build_community.yml](.github/workflows/licensed_image_build_community.yml)  | By using the Base docker image, this workflow adds your own community license supplied by Arm for the commercial tools. It is rebuilt every night and serves as the base image from which the actual container runtime environments are generated. It will also be stored on the Github docker registry. |



## Customize this repository

First create a fork into a user account or organization of your own (or commit to a new private repository). On your fork you need to make a couple of modifications:

1. Add own Activation Code (Arm UBL license)
The activation code is passed to the docker build process in a Github Actions secret called ARM_UBL_LICENSE_IDENTIFIER.
To set a secret called ARM_UBL_LICENSE_IDENTIFIER to a repository in Github, go to the repository's main page, click on "Settings", then "Secrets", and "New repository secret". Enter "ARM_UBL_LICENSE_IDENTIFIER" as the name and the activation code for the Arm UBL license as the value. Click on "Add secret". 

2. Customize Base Docker Image
Additional installations for custom tools you can add those to docker_base/Dockerfile. If you are new to Docker find a good starting point in the [Docker manual](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/).

Check the Actions view to verify the execution of all 4 workflows.

## Known Issues

The following items are at this moment not completed:

- Consistent support for GCC and LLVM compiler. Currently only Arm Compiler 6 is supported.
- Multiple demo projects for VSI usage (Sensor, Audio, Video) will be added.
- Arm Virtual Models are not yet available for vcpkg installation; use classic MDK version 5 for using AVH models.
