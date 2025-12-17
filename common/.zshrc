# OMZ
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 15
ENABLE_CORRECTION="true"

plugins=(
  git
  fzf
  z
  zoxide
  zsh-autosuggestions
  zsh-syntax-highlighting
)


# functions
# tetris PC number finder
pcn() {
  echo $((($1*5)%7+1))
}

# yt-dlp audio only
ytdlpa() {
  yt-dlp \
  -x -o "%(title)s.%(ext)s" \
  --audio-format mp3 \
  --embed-thumbnail \
  --add-metadata \
  "$@"
}

# yt-dlp audio only (playlist)
ytdlpap() {
  yt-dlp \
    -x -o "%(playlist_title)s/%(title)s.%(ext)s" \
  --audio-format mp3 \
  --embed-thumbnail \
  --add-metadata \
  "$@"
}


# aliases
## utilities
alias nv="nvim"
alias zj="zellij"
alias clock="tty-clock -sc -C 5"

eval "$(zoxide init zsh)"
alias ls="eza --icons --color=auto --group-directories-first"
alias ll="eza -lh --icons --group-directories-first"
alias la="eza -lah --icons --group-directories-first"
alias lS="eza -lS --icons --sort=size"
alias lt="eza -lT --icons --tree"

alias cd="z"
alias find="fd"
alias grep="rg"

## misc
alias ecf="TERM=xterm-256color ssh wang5371@ecf.utoronto.ca"
alias gitcommitdate="git commit -m '$(date +%Y-%m-%d)'"

## directories
alias gh="cd ~/Documents/gh/"
alias obi="cd /home/yuni/Documents/Obsidian\ Vault"

## edit/source configs
alias ez="nv ~/.zshrc"
alias vz="less ~/.zshrc"
alias sz="source ~/.zshrc"


# colors
teal="%{#94e2d5}"
flamingo="%{#f2cdcd}"
mauve="%{#cba6f7}"
pink="%{#f5c2e7}"
red="%{#f38ba8}"
peach="%{#fab387}"
green="%{#a6e3a1}"
yellow="%{#f9e2af}"
blue="%{#89b4fa}"
gray="%{#1f1d2e}"
black="%{#191724}"


# starship
eval "$(starship init zsh)"


# startup text
# echo "Hey $(whoami)!!!\nPLEASE remember to\n\e[1;95meat    sleep    clean (sh*wer)    exercise\e[0m"

export PATH=$PATH:/home/yuni/.spicetify
