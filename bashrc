export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Load rvm so you can access Ruby
source "$HOME/.rvm/scripts/rvm"

# Take you to the dir of a file in a gem. e.g. `2gem rspec`
2gem () {
  cd "$(dirname $(gem which $1))"
}

alias dotfiles="cd ~/.dotfiles"

# disable control flow commands to remap <c-s> in vim
stty -ixon

# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gc="git checkout"
alias gb="git branch"
alias gbr="git branch -r"
alias ga="git add"
alias gh="git hist"
alias gcm="git commit -m"
alias gr="git remote -v"
alias gra="git remote add"
alias gf="git fetch"
alias gr="git rebase"
alias gpush="git push"
alias gpull="git pull"

# shortcut to vimrc
alias vimrc="vim ~/.vimrc"

# shortcut to bash_profile
alias bash="vim ~/.bashrc"

# fancy ls command
# -l  long format
# -F  / after dirs, * after exe, @ after symlink
# -G  colorize
# -g suppress owner
# -o suppress group
# -h humanize sizes
# -q print nongraphic chars as question marks
alias l="ls -lFGgohq"

# git auto-completion
source ~/.git-completion.bash

# enables 'git hub'
eval "$(hub alias -s)"


# give the fullpaths of files passed in argv or piped through stdin
function fullpath {
  ruby -e '
    $stdin.each_line { |path| puts File.expand_path path }  if ARGV.empty?
    ARGV.each { |path| puts File.expand_path path }         unless ARGV.empty?
  ' "$@"
}

# Enable git's tab-completion library
source /usr/local/etc/bash_completion.d/git-completion.bash

# Shortcut for bundle exec
alias be="bundle exec"

# Prompt
  function parse_git_branch {
    branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
    if [ "HEAD" = "$branch" ]; then
      echo "(no branch)"
    else
      echo "$branch"
    fi
  }

  function prompt_segment {
    # for colours: http://en.wikipedia.org/wiki/ANSI_escape_code#Colors
    # change the 37 to change the foreground
    # change the 45 to change the background
    if [[ ! -z "$1" ]]; then
      echo "\[\033[${2:-37};45m\]${1}\[\033[0m\]"
    fi
  }

  function build_mah_prompt {
    # time
    ps1="$(prompt_segment " \@ ")"

    # cwd
    ps1="${ps1} $(prompt_segment " \w ")"

    # git branch
    git_branch=`parse_git_branch`
    if [[ ! -z "$git_branch" ]]
    then
      ps1="${ps1} $(prompt_segment " $git_branch " 32)"
    fi

    #turing
    alias turing='cd ~/Turing'
    alias projects='cd ~/Turing/projects'

    #dinner dash
    alias dd='cd ~/Turing/projects/dinner_dash'

    # next line
    ps1="${ps1}\n\$ "

    # set prompt output
    PS1="$ps1"
  }

  PROMPT_COMMAND='build_mah_prompt'