# Dotfiles

## Overview

Personal dotfiles and homelab configuration.

## Structure

### ansible/

Work-in-progress Ansible setup for my homeserver. Not all roles are complete but the setup is deployed and running on the server with Nextcloud, Paperless and backups enabled.

### home/

My dotfiles, symlinked by the stow script using GNU Stow.

### deploy

Provisions the home server with the `server.yml` playbook.
