# Setup a prompt for root and another one for users.
# rename this file to color_prompt.sh to actually enable it
NORMAL="\[\e[22m\]"
RESET="\[\e[0m\]"
ROOT="\[\e[38;5;226;1m\]"
USER="\[\e[38;5;208;1m\]"
if [ $(id -u) -eq 0 ]; then
    PS1="$ROOT\h [$NORMAL\W$ROOT]# $RESET"
else
    PS1="$USER\h [$NORMAL\W$USER]\$ $RESET"
fi
