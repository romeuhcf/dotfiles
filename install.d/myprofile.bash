function git_dirty {
  git diff --quiet HEAD &>/dev/null
  [ $? == 1 ] && echo "!"
}

function ruby_version() {
  ruby -v | sed 's/ruby /ruby-/g;s/\s.*//g'
}

# If we're in a git repository return the branch name,
# otherwise nothing.  Include the '...' here so it isn't
# duplicated in the output.
function ps1_git {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo " … "${ref#refs/heads/}
  }

  ps1="\[\e[0;34m\]"                         # colored text
  ps1=$ps1"\u@\h"                            # user@host
  ps1=$ps1"\$(rvm-prompt v)\$(rvm-prompt g)" # 1.9.3@gemset
  ps1=$ps1"\[\e[0;32m\]"                         # colored text
  ps1=$ps1"\$(ps1_git)"                      # git branch
  ps1=$ps1"\[\e[0;31m\]"                         # colored text
  ps1=$ps1"\$(git_dirty)"                      # git branch
  ps1=$ps1"\[\e[0;32m\]"                         # colored text
  ps1=$ps1" … "
  ps1=$ps1"[\$(ruby_version)]"                      # ruby version
  ps1=$ps1"\[\e[0;34m\]"                         # colored text
  ps1=$ps1" … "
  ps1=$ps1"\w"                               # relative working dir
  ps1=$ps1"\\n(\D{%F %T})"                              # new line
  ps1=$ps1"\$"                               # $
  ps1=$ps1" "                                # space
  ps1=$ps1"\[\e[0m\]"                        # reset color
  export PS1=$ps1
