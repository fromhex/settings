#########################
#    zstyle setting     #
#########################

# 总体配置
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' print-query alt-enter
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter
zstyle ':fzf-tab:*' continuous-trigger '/'


# fzf-tab样式
## kill 结束进程时时提供预览
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags '--preview-window=down:3:wrap'
## service
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
## env
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
        fzf-preview 'echo ${(P)word}'
## cd 时在右侧预览目录内容和文件内容
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -A -1 $realpath'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'

zstyle ':fzf-tab:complete:*:options' fzf-preview 
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview

# docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes




#########################
#      env setting      #
#########################

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH" 
export PATH="$HOME/.local/bin:$HOME/wireshark-4.0.1:$HOME/texlive/2022/bin/x86_64-linux:$PATH" 
# chrome TLS密钥地址，便于wiresahrk解密https流量
export SSLKEYLOGFILE="$HOME/Documents/sslkey.log"

# git状态检查超时设置
__git_prompt_git () {
    GIT_OPTIONAL_LOCKS=0 command timeout 1s git "$@"
}
# git状态检查超时设置

# >>> conda initialize >>>
conda_init_fun(){
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
    conda activate base
}
conda_init_fun
# >>> conda initialize >>>




#########################
#     alias setting     #
#########################

alias rm="trash-put"
alias ll="ls -alF"
alias ipy='ipython'
alias cs='__cds(){ cd $1 && ls ; };__cds'

alias mvn="$HOME/Documents/java/idea/plugins/maven/lib/maven3/bin/mvn"
alias ida="deepin-wine6-stable /media/$USER/Data/Download/IDA_Pro_7.7/ida.exe"
alias ida64="deepin-wine6-stable /media/$USER/Data/Download/IDA_Pro_7.7/ida64.exe"

alias v2rayct="sudo $HOME/Documents/grepo/mine/v2rayCT/v2rayCT"
alias pgit="proxychains4 -q git"
alias pcs="proxychains4 -q"
alias transz="trans zh:en"
