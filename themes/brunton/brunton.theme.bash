# shellcheck shell=bash

SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓${normal}"
SCM_GIT_CHAR="${bold_green}±${normal}"
SCM_SVN_CHAR="${bold_cyan}⑆${normal}"
SCM_HG_CHAR="${bold_red}☿${normal}"

is_vim_shell() {
	if [ -n "$VIMRUNTIME" ]; then
		echo "[${cyan}vim shell${normal}]"
	fi
}

prompt() {
	SCM_PROMPT_FORMAT=' %s (%s)'
	PS1="${white}${background_blue} \u${normal}${background_blue}@${red}${background_blue}\h $(clock_prompt) ${reset_color}${normal} $(battery_charge)\n${bold_black}${background_white} \w ${normal}$(scm_prompt)$(is_vim_shell)\n${white}>${normal} "
}

THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$blue$background_white"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-" %H:%M:%S"}

safe_append_prompt_command prompt
