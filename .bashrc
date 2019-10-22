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
alias pr="philog -rerun"
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

## COLORS ##
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White
# thank you to
#   http://www.csc.uvic.ca/~seng265l/tips/s265s013-tips/color-prompt.html

GRAD1='\333\262\261\260' 
GRAD2='\260\261\262\333'
YLOBRN='\[\033[01;33;43m\]'
WHTBRN='\[\033[01;37;43m\]'
REDBRN='\[\033[00;31;43m\]'
REDBLK='\[\033[00;31;40m\]'
PPLBLK='\[\033[01;35;40m\]'
WHTBLK='\[\033[01;37;40m\]'
NONE='\[\033[00m\]'
HBLK='\[\033[00;30;30m\]'
HBLU='\[\033[01;34;34m\]'
BLUE='\[\033[00;34;34m\]'
YELLOW='\[\033[01;33;33m\]'
WHITE='\[\033[01;37;37m\]'
PURPLE='\[\033[00;34;35m\]'
RED='\[\033[01;31;31m\]'
NORM='\[\033[01;00;0m\]'
LIGHTGREEN='\[\033[01;32m\]'
LIGHTBLUE='\[\033[01;36m\]'
