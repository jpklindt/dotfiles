# Better ls functionality

# Prompt for confirmation before recursive ls
def lr [] {
    print "Are you sure you want to list all files recursively? (y/n)"
    let answer = (input)
    if $answer == "y" {
        ls -a **/*
        } else {
            print "Operation cancelled."
    }
}

def l [] {
    ls -a . | sort-by type --reverse
}

def ll [] {
    ls -la . | sort-by type --reverse
}

def ld [] {
    ls -a | where type == dir
}

alias ls = ls -a
alias lt = eza --color=always --tree --level 2 --sort type 

# Copy and paste functionality depending on OS
def pbcopy [] {
    if $nu.os-info.name == "windows" {
        clip
    } else {
        xsel --clipboard --input
    }
}

def pbpaste [] {
    if $nu.os-info.name == "windows" {
        powershell get-clipboard
    } else {
        xsel --clipboard --output
    }
}

def mdpdf [$arg1, $arg2] {
    if $nu.os-info.name == "windows" {
        npx mdpdf
    } else {
        /home/jpklindt/dotfiles/scripts/mdpdf/convert.sh $arg1 $arg2
    }
}

def jupyter [] {
    nix-shell /home/jpklindt/dotfiles/nix-shell/jupyter/shell.nix
}

alias copy = pbcopy
alias paste = pbpaste

# Git aliases
alias gc = git commit -a -m 
alias gs = git add .
alias gss = git status
alias gp = git push
alias gpl = git pull



# Zoxide cd alias

# alias cd = z
# alias cdi = zi

# vim exit
alias :q = exit 

# Program aliases
alias code = code . 
alias cat = bat  # --theme \ Gruvbox Flat Dark\  

# Check rclone systemd services
alias rcstatus = journalctl --user -xeu rclone.service rclone.timer rclone.path
alias rcstat = rcstatus