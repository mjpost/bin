# Import colors
. ~/bin/.bashrc-colors

# Powerline-shell is a great tool.
# Install it via pip: "pip3 install powerline-shell".
# You can then dump the config file with "powerline-shell --generate-config > ~/.powerline-shell.json"
if [[ $(which powerline-shell > /dev/null) -eq 0 ]]; then
    function _update_ps1() {
        PS1="$(powerline-shell $?)"
    }

    if [ "$TERM" != "linux" ]; then
        PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    fi
fi

# Set up "Philipp's log" aliases
alias p="philog"
alias pp="philog -pretty"
alias ppd="philog -pretty -dir"
alias pd="philog -dir"
alias pe="vi .philog.LOGFILE"
alias ph="history | philog -history"

case $TERM in
    xterm*)
        PS1="\[\033]0; \w\007\]${BLUE}\$ ${NONE}"
        ;;
    *)
        PS1="\w\$ "
        ;;
esac
export PS1
