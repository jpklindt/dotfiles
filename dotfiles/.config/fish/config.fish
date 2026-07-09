if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    # Do nothing
end

# ENV
#
set -Ux FLAKE /home/jpklindt/dotfiles/
# set -Ux LS_COLORS "$(vivid generate gruvbox-dark-soft)"
set -Ux LC_CTYPE en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8
set -Ux EDITOR nvim
set -Ux VISUAL nvim

set -x LIBVIRT_DEFAULT_URI "qemu:///system"
# =============================================================================
#
# binds
# 

bind \eö forward-word
bind \el accept-autosuggestion
bind \ej prevd-or-backward-word
bind \ek nextd-or-forward-word

# =============================================================================
#
# Aliases.
#

# ls
alias l 'ls -a'
alias ll 'ls -lah'
alias ld 'ls -d */'
alias lt 'eza --color=always --tree --level 2 --sort type' 

alias pbcopy 'xsel --clipboard --input'
alias pbpaste 'xsel --clipboard --output'

# git
alias gc 'git commit -m'
#alias gs 'git stage'
alias gss 'git status'
alias ga 'git add'
alias gp 'git push'
alias gpl 'git pull'
alias gco 'git checkout'
alias gb 'git branch'

alias gemini 'npx @google/gemini-cli'
alias gm 'npx @google/gemini-cli --resume'

zoxide init fish | source
fzf --fish | source

# source (starship init fish --print-full-init | psub)


# Added by Antigravity CLI installer
set -gx PATH "/home/jpklindt/.local/bin" $PATH
