#export FZF_DEFAULT_OPTS='--bind=ctrl-t:top,change:top --bind ctrl-e:down,ctrl-u:up'
#export FZF_DEFAULT_OPTS='--bind ctrl-e:down,ctrl-u:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_DEFAULT_COMMAND='fd'
# Set up fzf key bindings and fuzzy completion


eval "$(fzf --bash)"
export FZF_TMUX_HEIGHT='80%'
# 搜索时忽略某些文件
export FZF_DEFAULT_COMMAND='find . -type f ! -path "*.git*"'

# 搜索结果中的预览功能
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --preview 'bat {}'"

# 定义文件搜索的快捷命令
export FZF_CTRL_T_COMMAND="find . -type f"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {}' --height=50% --layout=reverse --border"

# 自定义颜色
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=fg:#d8dee9,bg:#2e3440,hl:#88c0d0"

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='  '

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS='--walker file,dir,follow,hidden'

# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}
