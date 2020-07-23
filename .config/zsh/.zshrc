# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

autoload -U colors && colors	# Load colors
setopt autocd	

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#if [ -d "$HOME/.bin" ] ;
#  then PATH="$HOME/.bin:$PATH"
#fi

#if [ -d "$HOME/.local/bin" ] ;
#  then export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
#fi

[[ -f ~/.config/aliasrc ]] && source ~/.config/aliasrc

[[ -f ~/.config/aliasrc-personal ]] && source ~/.config/aliasrc-personal

#create a file called .zshrc-personal and put all your personal zsh config
#in there. They will not be overwritten by skel.

[[ -f ~/.config/zsh/.zshrc-personal ]] && source ~/.config/zsh/.zshrc-personal

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

test -r "~/.config/.dir_colors" && eval $(dircolors ~/.config/.dir_colors)

#source "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ -f ~/.config/zsh/p10k.zsh ]] && source ~/.config/zsh/p10k.zsh
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

neofetch
