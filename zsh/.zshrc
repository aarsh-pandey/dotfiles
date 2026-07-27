# ==============================================================================
# 1. ENVIRONMENT & COLORS
# ==============================================================================
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# Enable interactive terminal comments (lets you paste '#' lines into the shell)
setopt INTERACTIVE_COMMENTS

# ==============================================================================
# 2. PROMPT CONFIGURATION (Git & Visual Layout)
# ==============================================================================
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the git branch display (added a subtle color treatment)
zstyle ':vcs_info:git:*' formats '(on branch %b) '

setopt PROMPT_SUBST
NEWLINE=$'\n'

# Left and Right prompts
PROMPT='%B%F{85}@%n%f%b ➜ %B%F{33}%~%f%b %B%F{215}${vcs_info_msg_0_}%f%b$ '
RPROMPT="%B%F{230}(%?)%f%b"

# ==============================================================================
# 3. BEAUTIFIED NATIVE COMPLETION SYSTEM
# ==============================================================================
autoload -Uz compinit && compinit

# Enable interactive menu navigation with arrow keys
zstyle ':completion:*' menu select

# Seamless navigation: wrap around rows/columns when hitting menu borders
zstyle ':completion:*' menu select=long-list select=0

# Group layout configs
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Elegant headers: muted gray lines so your orange selection stands out cleanly
zstyle ':completion:*:descriptions' format '%F{242}── %d ──%f'

# Beautiful match highlighting: vibrant bold orange text on an integrated, deep slate block
# zstyle ':completion:*:default' list-colors "no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:ma=01;38;5;208;48;5;236"
# zstyle ':completion:*:default' list-colors "no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:ma=01;04;38;5;208;40"
# zstyle ':completion:*:default' list-colors "no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:ma=01;38;5;117;40"
zstyle ':completion:*:default' list-colors "no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:ma=01;04;38;5;117;40"

# Smart typo correction (1 error per 3 characters)
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 'reply=($(( ($#PREFIX+$#SUFFIX)/3 )) )'

# Bind Shift+Tab to move backward through completion choices
bindkey '^[[Z' reverse-menu-complete
