# Dotfiles

## Overview

Personal dotfiles and homelab configuration.

The repository is currently in transition, migrating from manually managed podman-compose stacks to a fully automated Ansible deployment.

## Structure

### ansible/

Work-in-progress Ansible setup. The goal is to provision every machine in my homelab by running the corresponding playbook, or automatically based on hostname. Playbooks are tested against Vagrant VMs before being applied to the real systems.

### containers/

Legacy compose stacks, still deployed on my home server via rootless podman. Also includes some currently unused Dockerfiles for game servers.

### home/

My dotfiles, symlinked by the `dotfiles` role.

### sync

Picks and executes the correct playbook for the current device.

#### Usage

    ./sync --tags dotfiles                  # dotfiles tasks only
    ./sync --tags dotfiles --check --diff   # preview changes
