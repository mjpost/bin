# Import colors
. ~/.bashrc-colors

# Set up "Philipp's log" aliases
alias p="philog"
alias pp="philog -pretty"
alias ppd="philog -pretty -dir"
alias pd="philog -dir"
alias pe="vi .philog.LOGFILE"
alias ph="history | philog -history"

case $TERM in
    xterm*)
        PS1="\[\033]0;\u@\h: \w\007\]${BLUE}\$ ${NONE}"
        ;;
    *)
        PS1="\w\$ "
        ;;
esac
export PS1
