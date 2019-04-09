alias tmux="env TERM=screen-256color-bce tmux"

# カーソルキーを無効にする
#do-nothing() {
#}
#zle -N do-nothing
#bindkey '^[OA' do-nothing
#bindkey '^[OB' do-nothing
#bindkey '^[OC' do-nothing
#bindkey '^[OD' do-nothing
#
#bindkey -M menuselect '^[OA' do-nothing
#bindkey -M menuselect '^[OB' do-nothing
#bindkey -M menuselect '^[OC' do-nothing
#bindkey -M menuselect '^[OD' do-nothing

alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gbd='git branch -D'
alias gco='git commit -m'
alias gcoa='git commit -a -m'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdv='git diff | vim -'
alias gdcv='git diff --cached | vim -'
alias gf='git fetch'
alias gl='git log'
alias gpl='git rev-parse --abbrev-ref HEAD | xargs git pull origin'
alias gps='git rev-parse --abbrev-ref HEAD | xargs git push origin'
alias gr='git reset'
alias gss='git stash'
alias gssl='git stash list'
alias gssp='git stash pop'
alias gst='git status'

