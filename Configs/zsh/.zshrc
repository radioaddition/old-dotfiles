PATH=/home/radioaddition/.local/bin:/home/radioaddition/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/radioaddition/.cargo/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/var/home/linuxbrew/.linuxbrew/Cellar/zplug/2.4.2/bin
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "jeffreytse/zsh-vi-mode"
zplug "romkatv/powerlevel10k", as:theme, depth:1
if ! zplug check; then
  zplug install
fi
zplug load

# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

EDITOR="nvim"
source "$HOME/.p10k.zsh"
eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"
GPG_TTY="$(tty)"
export GPG_TTY
# Aliases
alias -- 'archive'='tar -czvf archive.tar.gz '
alias -- 'bbic'='brew update && brew bundle install --cleanup --file=~/.config/Brewfile --no-lock && brew upgrade'
alias -- 'clean'='nix-env --delete-generations old && nix-collect-garbage -d'
alias -- 'cleanr'='sudo nix-env --delete-generations old && sudo nix-collect-garbage -d'
alias -- 'clearls'='clear && ls -A'
alias -- 'extract'='tar -xzvf '
alias -- 'ls'='eza'
alias -- 'rootsh'='run0 sh -c "zsh"'
alias -- 'vivi'='nvim /home/radioaddition/.config/nvim/init.vim'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
