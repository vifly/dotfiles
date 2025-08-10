# 加载 Zinit
source ~/.local/bin/zinit/zinit.zsh

# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

# 语法高亮
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma-continuum/fast-syntax-highlighting

# 增强版历史记录
zinit ice lucid wait="0" pick="sqlite-history.zsh" atload='autoload -Uz add-zsh-hook'
zinit light larkery/zsh-histdb

# 自动建议
zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions
# zstyle ':completion:*:complete:*' cache-path "${HOME}/.zcompdump"

# 加载 OMZ 框架及部分插件
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

# 加载 pure 主题
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# 自定义 pure 主题内容
zstyle :prompt:pure:git:branch color cyan
zstyle :prompt:pure:path color blue
zstyle :prompt:pure:prompt:success color yellow
PURE_PROMPT_SYMBOL=' >>'
prompt_newline='%666v'
PROMPT=" $PROMPT"

# alias 设置
(( $+commands[bat] )) && alias cat="bat --theme 'Coldark-Dark'"
(( $+commands[prettyping] )) && alias ping=prettyping
(( $+commands[exa] )) && alias ls=exa
(( $+commands[exa] )) && alias tree="exa --tree -a"
alias la="ls -alh"
alias ll="ls -lh"
alias pythonhttpserver="python3 -m http.server"
alias pdb="python3 -m pdb"
alias pj="python3 -m json.tool"
alias pb="curl -F 'c=@-' 'https://fars.ee/'"
alias sys='sudo systemctl'
alias rmrf="rm -rf"
alias gitcm="git commit -m"

# 设置环境变量
# XDG base directory
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export SYSTEMD_EDITOR=nano
export EDITOR=vim

export GOBIN="$HOME/.local/bin"
export GO111MODULE="on"
export GOPROXY="https://goproxy.cn,direct"

export DEBUGINFOD_URLS="https://debuginfod.archlinux.org https://repo.archlinuxcn.org"

export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# 让程序遵循 XDG 规范
source $XDG_CONFIG_HOME/zsh/zsh_xdg

# 加载一些私密的 alias
[ -f $XDG_CONFIG_HOME/zsh/zshrc.local ] && source $XDG_CONFIG_HOME/zsh/zshrc.local

# 美化 time 的输出
autoload -Uz colors
colors
() {
    local white_b=$fg_bold[white] blue=$fg[blue] rst=$reset_color
    TIMEFMT=("$white_b%J$rst"$'\n'
        "User: $blue%U$rst"$'\t'"System: $blue%S$rst  Total: $blue%*Es$rst"$'\n'
        "CPU:  $blue%P$rst"$'\t'"Mem:    $blue%M MB$rst")
}

# zsh-histdb 与 zsh-autosuggestions 的集成
_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=(histdb_top_here match_prev_cmd completion)
