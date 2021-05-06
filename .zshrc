if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias emw="sudo emerge -avuDN @world"
alias emc="sudo emerge -c"
alias em="sudo emerge"
alias ems="sudo emerge -s"
alias ra="ranger"

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-syntax-highlighting autojump zsh-autosuggestions git)

source $ZSH/oh-my-zsh.sh

[[ -s /usr/share/autojump/autojump.zsh  ]] && . /usr/share/autojump/autojump.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
