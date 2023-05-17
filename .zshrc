# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Productivity aliases
alias l='ls -CF'
alias ls='ls -larth'
alias c='clear'
alias reload='source ~/.zshrc'
alias fecore='cd ~/frontend/frontend-core'
alias feclient='cd ~/frontend/frontend-client'
alias becore='cd ~/backend/backend-core'
alias beclient='cd ~/backend/backend-client'
alias zshrc='code ~/.zshrc'

sc() {
  if [ $1 = "backendcore" ]; then
    export "DJANGO_SETTINGS_MODULE=backendcore.backend.settings.local"
  else
    export "DJANGO_SETTINGS_MODULE=$1.backend.local"
  fi
}

# Activate virtual envs
alias benv='source ~/backend/backend-core/venv/bin/activate'
alias lenv='source ~/login-server/venv/bin/activate'
alias oenv='source ~/olympus/venv/bin/activate'

# https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index
alias gcm='git commit -m'
alias gp='git push'
alias gpu='git pull'
alias gbl='git branch -l'
alias gmm='git checkout main && git pull && git checkout - && git merge main'

# Django aliases
alias runserver='python manage.py runserver'
alias runlogin='python manage.py runserver 0.0.0.0:8001'
alias migrate='python manage.py migrate'
alias runtest='python manage.py test'
alias whatclient='echo $DJANGO_SETTINGS_MODULE'

createsu() {
  python "manage.py" "create_admin_superuser" $1 $2
}

# Frontend aliases
alias corestart='pnpm --filter=frontend-core start'
alias coretest='npm run core:test-ci'
alias plsnpm='npm install --prefix=packages/frontend-core'

# For frontend repo:
HOMEBREW_NO_AUTO_UPDATE=1
export REACT_APP_API_ROOT=http://localhost:8000

export PATH=/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# for pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH=$(pyenv root)/shims:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# for psql
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"

# for npm
export PATH="/usr/local/opt/node@14/bin:$PATH"

# AWS
alias asl='aws sso login'

# DJANGO stuff

# export DJANGO_SETTINGS_MODULE=backendcore.backend.settings.local
export DJANGO_SETTINGS_MODULE=c1132.backend.local
export SETTINGS_DOTENV_FILE=/Users/joshuamenezes/backend/backend-core/backendcore/backend/settings/.env
export PYTHONUNBUFFERED=1
export DONT_SYNC_WITH_LOGIN_SERVER=1

# NVM STUFF
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Change prompt to and initial segment colour
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "root" || -n "$SSH_CONNECTION" ]]; then
    prompt_segment 234 34 " %(!.%{%F{black}%}.)$user "
  else
    prompt_segment 12 65 " %(!.%{%F{black}%}.) $user "
  fi
}