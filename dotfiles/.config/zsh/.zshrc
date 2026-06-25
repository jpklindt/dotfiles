# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Install Zinit if missing
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

### Zinit plugins

# Add powerlevel10k theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
#zinit light Aloxaf/fzf-tab

# Add git
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

autoload -U compinit && compinit

zinit cdreplay -q

### End of Zinit plugins

### Keybindings

bindkey '^[l' autosuggest-accept
bindkey '^[ö' forward-word 

# Bind Ctrl + Right Arrow to move forward a word
bindkey '^[[1;5C' forward-word


# Bind Ctrl + Left Arrow to move backward a word
bindkey '^[[1;5D' backward-word

bindkey "^H" backward-kill-word

### Aliases

alias cat="bat" # --theme \"Gruvbox Flat Dark\""
alias ls="eza --color=always --icons --oneline -a --sort type"
alias lt="eza --icons --color=always --tree --level 2 --sort type"
alias l="eza -lah --sort type"
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"
alias zsource="source ~/.zshrc"
alias zedit="nvim ~/.zshrc && zsource"
alias :q="exit"
alias switch="nh os switch"

### End of Aliases

### History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

source ~/dotfiles/.fzfrc

### nvim in sudoedit
SUDO_EDITOR=/home/linuxbrew/.linuxbrew/bin/nvim
export SUDO_EDITOR

FLAKE=/home/jpklindt/dotfiles/
export FLAKE

### Zoxide initialization ("builtin" added to get around recursion error)

eval "$(zoxide init --cmd cd zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jpklindt/.sdkman"
[[ -s "/home/jpklindt/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jpklindt/.sdkman/bin/sdkman-init.sh"


# Added by Antigravity CLI installer
export PATH="/home/jpklindt/.local/bin:$PATH"
