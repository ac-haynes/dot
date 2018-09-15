HISTTIMEFORMAT="%d/%m/%y %T "
export PROMPT_COMMAND='history -a'

log_bash_persistent_history()
{
  [[
    $(history 1) =~ ^\ *[0-9]+\ +([^\ ]+\ [^\ ]+)\ +(.*)$
  ]]
  local date_part="${BASH_REMATCH[1]}"
  local command_part="${BASH_REMATCH[2]}"
  if [ "$command_part" != "$PERSISTENT_HISTORY_LAST" ]
  then
    echo $date_part "|" "$command_part" >> ~/.persistent_history
    export PERSISTENT_HISTORY_LAST="$command_part"
  fi
}

# Stuff to do on PROMPT_COMMAND
run_on_prompt_command()
{
    log_bash_persistent_history
}

PROMPT_COMMAND="run_on_prompt_command"

PROMPT_COMMAND='printf "\033]0;%s\007" "`hostname`""$""`pwd`"'
PATH=$PATH:~/.local/bin

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

#export GREP_OPTIONS='--color=auto'
export EDITOR=/usr/bin/vim

alias ls='ls --color'
alias grep='grep --color'
alias ll='ls -larth --group-directories-first'
alias sortip='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4'

alias fuck='sudo $(history -p \!\!)'

alias bethcount='ps -u wildfly -o thcount,args | grep [o]racle | awk '"'"'{print $1,$30}'"'"''
alias connectorcount='ps -u root -o thcount,args | grep [c]onnector | awk '\''{print $1,$5}'\'''
alias tmux='tmux -u'

alias tlayout="tmux source-file .tmux-layout.conf"


eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias FUCK)"

alias mstsctslt="rdesktop 142.54.63.74 -g 1680x1050 -5 -K -r clipboard:CLIPBOARD -u   L >/dev/null 2>&1 &"
alias mstsclt="rdesktop laptop -g 1680x1050 -5 -K -r clipboard:CLIPBOARD -u  -d domain.tld >/dev/null 2>&1 &"
alias mstscltfs="rdesktop laptop -g 3440x1440 -5 -K -r clipboard:CLIPBOARD -u  -d domain.tld >/dev/null 2>&1 &"
alias mstsclths="rdesktop laptop -g 1680x1380 -5 -K -r clipboard:CLIPBOARD -u  -d domain.tld >/dev/null 2>&1 &"

alias mstscws="rdesktop 4.2.2.2 -g 1680x1050 -5 -K -r clipboard:CLIPBOARD -u  -d domain.tld >/dev/null 2>&1 &"
alias mstscwshs="rdesktop 4.2.2.2 -g 1680x1380 -5 -K -r clipboard:CLIPBOARD -u  -d domain.tld >/dev/null 2>&1 &"
alias mstscwsfs="rdesktop 4.2.2.2 -g 3440x1440 -a 15 -5 -K -r clipboard:CLIPBOARD -u  -d domain.tld >/dev/null 2>&1 &"

alias mstscmtmt="rdesktop server  -g 1680x1050 -5 -K -r clipboard:CLIPBOARD -u user -d domain.tld >/dev/null 2>&1 &"
alias mstsckodi="rdesktop mediaserver -g 1680x1050 -5 -K -r clipboard:CLIPBOARD -u media  >/dev/null 2>&1 &"
#alias mstsc="rdesktop $1 -g 1680x1050 -5 -K -r clipboard:CLIPBOARD -u $2 -d domain.tld &"
alias explorer="kill `ps aux  | grep [n]emo | tr -s ' ' |cut -f 2 -d ' '` ; sleep 2 ; nemo &"
export PROMPT_COMMAND='history -a'


export GOPATH=/usr/local/go/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
#./home/andrew/src/torch/install/bin/torch-activate
alias config='/usr/bin/git --git-dir=/home/andrew/.cfg/ --work-tree=/home/andrew'
alias buildvpn='ssh -D 8080 -f -q -N root@proxy.alfhaynso.com'
