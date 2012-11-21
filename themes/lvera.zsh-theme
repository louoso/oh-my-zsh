PROMPT='%n %{$fg[cyan]%}%~%{$reset_color%} $(better_git_prompt_info) $ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=")%{$fg[blue]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=")"

# Git sometimes goes into a detached head state. git_prompt_info doesn't
# return anything in this case. So wrap it in another function and check
# for an empty string.
function better_git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -z $(git_prompt_info) ]]; then
            if [[ -z $(git describe --tags --exact-match 2>/dev/null) ]]; then
              echo "(%{$fg[magenta]%}$(git rev-parse --short HEAD)%{$reset_color%})"
            else
              echo "(%{$fg[magenta]%}$(git describe --tags --exact-match)%{$reset_color%})"
            fi
        else
            echo "$(git_prompt_info)"
        fi
    fi
}
