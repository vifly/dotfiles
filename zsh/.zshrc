# 加载 Zinit
source ~/.local/bin/zinit/zinit.zsh

# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

# 语法高亮
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

# 自动建议
zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions
zstyle ':completion:*:complete:*' cache-path "${HOME}/.zcompdump"

# 加载 OMZ 框架及部分插件
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit ice lucid wait='1'
zinit snippet OMZ::plugins/git/git.plugin.zsh

# 加载 pure 主题
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# 自定义 pure 主题内容
zstyle :prompt:pure:git:branch color cyan
zstyle :prompt:pure:path color blue
zstyle :prompt:pure:prompt:success color yellow
PURE_PROMPT_SYMBOL=' >>'
prompt_newline='%666v'
PROMPT=" $PROMPT"

# fuck 的设置
eval $(thefuck --alias)

# alias 设置
alias cat="bat --theme 'Sublime Snazzy'"
alias ping=prettyping
alias ls=exa
alias la="ls -alh"
alias find=fd
alias pythonhttpserver="python3 -m http.server"
alias pb="curl -F 'c=@-' 'https://fars.ee/'"
alias sys='sudo systemctl'

# 加载一些私密的 alias
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# 设置环境变量
export PATH=$HOME/.local/bin:$PATH
#export XDG_CONFIG_HOME="~/.config"
export SYSTEMD_EDITOR=nano
export EDITOR=vim

# 美化 time 的输出
autoload -Uz colors
colors
() {
    local white_b=$fg_bold[white] blue=$fg[blue] rst=$reset_color
    TIMEFMT=("$white_b%J$rst"$'\n'
        "User: $blue%U$rst"$'\t'"System: $blue%S$rst  Total: $blue%*Es$rst"$'\n'
        "CPU:  $blue%P$rst"$'\t'"Mem:    $blue%M MB$rst")
}
