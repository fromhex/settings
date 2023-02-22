export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

setopt extended_history # 显示历史时间戳。
setopt hist_expire_dups_first # 修剪历史时首先过期重复事件。
setopt hist_find_no_dups # 不显示以前发现的事件。
setopt hist_ignore_all_dups # 从历史记录中删除较旧的重复条目。
setopt hist_ignore_dups # 不记录刚刚记录的事件。
setopt hist_ignore_space # 不记录以空格开头的事件。
setopt hist_reduce_blanks # 从历史项目中删除多余的空白。
setopt hist_save_no_dups # 不要将重复的事件写入历史文件。
setopt hist_verify # 在历史扩展时不要立即执行。
setopt inc_append_history # 立即写入历史文件，而不是在 shell 退出时。
setopt share_history # 在 shell 的不同实例之间共享历史记录。
setopt auto_pushd # 使 cd 将旧目录推送到目录堆栈上
setopt pushd_ignore_dups

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/src/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone --depth=1 https://github.com/zdharma-continuum/zinit "$HOME/.zinit/src" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.zinit/src/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

# OMZ的一些lib库
zinit for \
    OMZL::theme-and-appearance.zsh \
    OMZL::spectrum.zsh \
    OMZL::git.zsh \
    OMZL::history.zsh\
    OMZL::key-bindings.zsh \
    OMZL::completion.zsh \
    OMZL::functions.zsh

# 主题
zinit for \
    https://github.com/fromhex/settings/tree/main/zsh/myys.zsh-theme

# 补全相关
zinit wait lucid light-mode for \
        Aloxaf/fzf-tab \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

zinit wait lucid as"completion" for \
    https://github.com/fromhex/settings/blob/main/conda/_conda \
    https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker \
    OMZP::docker-compose/_docker-compose
# 插件
zinit wait lucid for \
    OMZP::git \
    OMZP::colored-man-pages \
    OMZP::sudo \
    OMZP::web-search \
    OMZP::extract \
    OMZP::docker-compose

zinit svn wait lucid for OMZP::wd

# 环境变量和alias命令
[ -f ~/.config/zshrc.sh ] && source ~/.config/zshrc.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
