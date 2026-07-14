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

Provisions the current machine with the `workstations.yml` playbook.

### deploy

Provisions the home server with the `server.yml` playbook.

### stow

Symlinks dotfiles into home directory. Requires GNU Stow.
