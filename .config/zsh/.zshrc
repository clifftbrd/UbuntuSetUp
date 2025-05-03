
# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[green]%}%t%b %B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt auto_cd #auto cd to directory without "cd"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
#setopt Auto_list

export PATH=$PATH:$HOME/.local/bin
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XAUTORITY=/home/cliff/.XAUTHORITY
export DISPLAY=:0
export EDITOR=vim
export TERMINAL=st
export VISUAL=vim

#  Alias's to modified commands

  alias cat='batcat'
  alias cls='clear'
  alias cp='cp -i'
  alias clamlog='cat ~/.cache/history/$(date "+%b-%d-%Y").log'
  alias ezrc='vim $ZDOTDIR/.zshrc'
  alias freshclam='sudo freshclam'
  alias jour='journalctl -r'
  alias gitkey='eval "$(ssh-agent -s)"&&ssh-add $HOME/.ssh/gitkey'
  alias jourb='journalctl -p 3 -xb'
  alias jaffy='ssh jaffy'
  alias less='less -R'
  alias logout='killsession'
  alias refreshbar='pkill -SIGUSR1 dwmblocks'
  alias mirrorlist='cat /etc/pacman.d/mirrorlist'
  alias mkdir='mkdir -p'
  alias mv='mv -i'
  alias ping='ping -c 10'
  alias rm='trash -v'
  alias weather='curl wttr.in'
  alias vi='vim'
  alias svim='sudo vim'
  alias vis='vim "+set si"'
  alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
  function volchg() { pactl set-sink-volume @DEFAULT_SINK@ $1% }
  alias ticker='ticker --config $HOME/.config/.ticker.yaml'

#FZF related aliases
  alias installsearch="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"  
  alias removesearch="pacman -Qeq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
  alias vimfind='fzf --print0 | xargs -0 -o vim'
  alias svimfind='fzf --print0 | xargs -0 -o svim'

# Alias's for multiple directory listing commands
  alias killsession='kill $XSESSION_PID'

source $ZDOTDIR/lslist.zsh
#  alias la='ls -Alh'                # show hidden files
##  alias ls='ls -Fh --color=always' # add colors and file type extensions
#  alias ls='ls --color'             # add colors 
#  alias lx='ls -lXBh'               # sort by extension
#  alias lk='ls -lSrh'               # sort by size
#  alias lc='ls -ltcrh'              # sort by change time
#  alias lu='ls -lturh'              # sort by access time
#  alias lr='ls -lRh'                # recursive ls
#  alias lt='ls -ltrh'               # sort by date
#  alias lm='ls -Alh |more'          # pipe through 'more'
#  alias lw='ls -xAh'                # wide listing format
#  alias ll='ls -Fls'                # long listing format
#  alias labc='ls -lAp'              # alphabetical sort
#  alias lf="ls -lA | grep -E -v '^d'"  # files only
#  alias ldir="ls -lA |grep -E '^d'"   # directories only
#  alias lla='ls -Al'                # List and Hidden Files

# emacs keybind
#bindkey -e

# vi keybind
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# up one directory
upone() {cd ..}
zle -N upone
bindkey "^U" upone

# autocomplete menuselect and styling
zstyle ':completion:*' menu no 
zstyle ':completion:*' gain-privileges 1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

#if [ -f /usr/bin/fastfetch ]; then fastfetch;fi
#source <(~/.fzf/bin/fzf --zsh)
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
source $ZDOTDIR/auto-ls.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/fzf-tab/fzf-tab.plugin.zsh

autoload -U compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
