
# cite 'about-alias'
# about-alias 'Tmux terminal multiplexer'

alias tx='tmux'
alias txl='tmux ls'
alias txn='tmux new -s'
alias txa='tmux a -t'
alias txk='tmux kill-session -t'
# alias txo='.tmux/proj-$1'

txo() {
  # echo '.tmux/proj-'$1
  ./.tmux/proj-$1 $2
}


alias vm="nvim"

alias cdre='cd ~/Documents/Repositories'
alias cdno='cd ~/Documents/NotesCodes'
alias cdf='cd ~/Documents/Projects/FoodSecurity'
alias cdbw='cd ~/Documents/Projects/FoodSecurity/5.Studies/Birthweight'
alias cdcpp='cd ~/Documents/SelfLearning/Programming/cpp'
