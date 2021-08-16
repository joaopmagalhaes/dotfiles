# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/joao/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=7

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nano ~/.zshrc"
alias aptupdate="sudo apt update --assume-yes && sudo apt upgrade --assume-yes && sudo apt autoremove --assume-yes"
alias kcore="cd /home/joao/kununu/core"
alias kfetchimages="kcore && cd devops/terraform/kununu/bin && ./fetch_ecr_images.sh && kcore"
alias btlvl="/home/joao/.local/bin/bluetooth_battery 60:F4:3A:29:D5:BF"
alias btcnt="bluetoothctl connect 60:F4:3A:29:D5:BF"

klogin() {
  kununu sts -l "$1"
  cd "/home/joao/kununu/core/devops/k8s"
  ./bin/ecr-login.sh
  kcore
}

klogintl() {
  kununu sts -r TeamLeaders -o "$1"
  cd "/home/joao/kununu/core/devops/k8s"
  ./bin/ecr-login.sh
  kcore
}

kcc() {
  cd "/home/joao/kununu/tech_challenges/test_react_new_work"
  git remote add "$1" git@github.com:xing/fe_codingchallenge-"$1".git
  git push -u "$1" master
  git remote remove "$1"
}
