alias ls="ls -GF"
alias la="ls -A"
alias ll="ls -oha"

cdls ()
{
    \cd "$@" && ls
}
alias cd="cdls"

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ..="cd .."

alias py="python3"

# 文字コードの指定
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors
PROMPT='
%F{black}%K{white} %D %* %F{white}%K{cyan}%F{black}%K{cyan} %c %k%F{cyan}%f '

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# ビープ音の停止
setopt no_beep

# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完機能を有効にする
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# 補完候補のカーソル選択を有効にする
zstyle ':completion:*:default' menu select

# プラグインを有効化
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# コマンドのスペルを訂正
setopt correct

# cdr の設定
# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
# zstyle ':chpwd:*' recent-dirs-max 1000

### peco
# ctrl + Rで、pecoでhistoryを参照
function peco-select-history() {
    # historyを番号なし、逆順、最初から表示。
    # 順番を保持して重複を削除。
    # カーソルの左側の文字列をクエリにしてpecoを起動
    BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER")"
    CURSOR=$#BUFFER             # カーソルを文末に移動
    zle -R -c                   # refresh
}
zle -N peco-select-history
bindkey '^R' peco-select-history

# search a destination from cdr list and cd the destination
function peco-cdr() {
  local destination="$(cdr -l | sed 's/^[0-9]* *//' | peco --prompt="cdr >" --query "$LBUFFER")"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^E' peco-cdr

