# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.209.6/containers/ubuntu/.devcontainer/base.Dockerfile

FROM ubuntu:latest

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Configure apt
ENV DEBIAN_FRONTEND=noninteractive

# Config user
ENV USERNAME=vscode
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install helpful tooling
# (git, process tools, lsb-release; common in install instructions for CLIs)
RUN apt-get update -y && \
  apt-get -y install --no-install-recommends \
  apt-utils \
  sudo \
  git \
  procps \
  lsb-release \
  curl unzip gnupg \
  bash-completion \
  keychain \
  python3-pip \
  apt-transport-https \
  ca-certificates \
  gnupg-agent \
  software-properties-common \
  npm \
  ipcalc \
  2>&1
  
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
  && chmod 0440 /etc/sudoers.d/$USERNAME

# Install Gcloud, and Python Apis (curl and apt-utils need to be installed first)
RUN echo "deb http://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
  apt-get update -y && \
  apt-get -y install --no-install-recommends \
  google-cloud-sdk \
  python3-google-auth \
  2>&1  

# Install precommit and plugins
RUN pip3 install --upgrade pre-commit detect-secrets google-api-python-client

# Hashicorp Tooling
# # Install Terragrunt
# ENV TERRAGRUNT_VERSION=0.28.24
# ENV TERRAGRUNT_TFPATH=/bin/terraform
# RUN curl -sL https://github.com/gruntwork-io/terragrunt/releases/download/v$TERRAGRUNT_VERSION/terragrunt_linux_amd64 \
#   -o /bin/terragrunt && chmod +x /bin/terragrunt

# Terraform
RUN sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
RUN sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN sudo apt-get update && sudo apt-get install terraform

# get tfenv instead of terraform for ease of module switching
ENV TERRAFORM_VERSION=1.0.4
RUN git clone https://github.com/tfutils/tfenv.git /home/$USERNAME/.tfenv && \
  chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.tfenv

# Install terraform-docs
ENV TERRAFORM_DOCS_VERSION=0.11.2
RUN curl -SL https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-$(uname)-amd64.tar.gz > terraform-docs.tar.xz && \
  tar xzf terraform-docs.tar.xz -C /bin && \
  rm -f terraform-docs.tar.xz

# Install create-token
RUN gsutil cp gs://cts-public-images-1-artifacts/create-token/create-token . && \
  chmod +x create-token && \
  mv create-token /usr/bin

# Install mukluk
ENV MUKLUK_VERSION=3.0.4
RUN gsutil cp gs://cts-public-images-1-artifacts/mukluk/mukluk_v${MUKLUK_VERSION} /usr/bin/mukluk && \
  chmod +x /usr/bin/mukluk

# Install Docker CE CLI and vim
RUN curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | apt-key add - 2>/dev/null \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" \
  && apt-get update \
  && apt-get install -y docker-ce-cli vim \
  #
  # Install Docker Compose
  && curl -sSL "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose

# Clean up
RUN apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

# Set the default shell to bash instead of sh
ENV SHELL /bin/bash

USER vscode  
