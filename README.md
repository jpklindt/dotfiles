# Dotfiles

## Overview

Personal dotfiles and homelab configuration.

## Structure

### ansible/

Work-in-progress Ansible setup for my homeserver. Not all roles are complete but the setup is deployed and running on the server with Nextcloud, Paperless and Backups enabled.

### home/

My dotfiles, symlinked by the stow script.

### deploy

Provisions the home server with the `server.yml` playbook.

### stow

Symlinks dotfiles into home directory using GNU Stow.
