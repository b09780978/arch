export TERM="xterm-256color"

# Install zinit if not installed
if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
  mkdir ~/.zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

source ~/.zinit/bin/zinit.zsh

# Theme
zinit ice depth=1
zinit light agnoster/agnoster-zsh-theme

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light marlonrichert/zsh-autocomplete
zinit light hlissner/zsh-autopair
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma-continuum/fast-syntax-highlighting

zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

alias ll="ls -al"
alias vi="nvim"
alias vim="nvim"
alias grep='grep --color=always'

export PATH=${PATH}:~/.local/bin
