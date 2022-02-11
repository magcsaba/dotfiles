if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

export GIT_PS1_SHOWDIRTYSTATE=1           # '*'=unstaged, '+'=staged
export GIT_PS1_SHOWUNTRACKEDFILES=1       # '%'=untracked
source ~/.git-prompt.sh
PS1='\e[47;0;36m\w\e[40;0;31m$(__git_ps1 " [%s]")\e[47;0;37m \n└─ \$ '

alias config='/usr/bin/git --git-dir=/home/csabam/.cfg/ --work-tree=/home/csabam'
alias gti='/usr/bin/git'
alias got='/usr/bin/git'

