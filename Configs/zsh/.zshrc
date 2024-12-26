PATH=/home/radioaddition/.local/bin:/home/radioaddition/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/radioaddition/.cargo/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/var/home/linuxbrew/.linuxbrew/Cellar/zplug/2.4.2/bin
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -U path cdpath fpath manpath

export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "jeffreytse/zsh-vi-mode"
#zplug "romkatv/powerlevel10k", as:theme, depth:1
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

export EDITOR="nvim"
export MANPAGER='nvim +Man!'
source "$HOME/.p10k.zsh"
eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
GPG_TTY="$(tty)"
export GPG_TTY
# Aliases
alias -- 'archive'='tar -czvf archive.tar.gz '
alias -- 'dotup'='export dir="$PWD" && cd ~/.dotfiles && git add -AN && git commit -a && git push && cd $dir'
alias -- 'bbic'='brew update && brew bundle install --cleanup --file=~/.config/Brewfile --no-lock && brew upgrade'
flatdec() {
	bash -c '\
		if [ ! -f $HOME/.config/flatpaks ]; then
			flatpak list --app --columns=application | tail -n +1 | sort | tee $HOME/.config/flatpaks
		fi
		flatpak install $(grep -v "^#" "./.config/flatpaks") --noninteractive --or-update
		flatpak uninstall $(flatpak list --app --columns=application | tail -n +1 | cat $HOME/.config/flatpaks - | grep -v "^#" | sort | uniq -u) --noninteractive --delete-data
		flatpak uninstall --noninteractive --unused --delete-data'
}
alias -- 'clearls'='clear && ls -A'
alias -- 'extract'='tar -xzvf '
alias -- 'ls'='eza'
alias -- 'vivi'='nvim /home/radioaddition/.config/nvim/init.vim'
alias -- 'cd'='z'
alias -- 'cdi'='zi'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
