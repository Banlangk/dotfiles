[[ -r ~/.zsh_plugins/znap/znap.zsh ]] || \
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh_plugins/znap
source ~/.zsh_plugins/znap/znap.zsh

znap source romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

znap source zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history)

znap source zsh-users/zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

znap source MichaelAquilina/zsh-you-should-use

znap source jeffreytse/zsh-vi-mode
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_USER_DEFAULT
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_USER_DEFAULT
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

eval "$(zoxide init zsh)"

source <(fzf --zsh)

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -aF --color'
alias grep='grep --color'
alias mkdir='mkdir -pv'

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
