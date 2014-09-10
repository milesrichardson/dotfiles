# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Add qt to path
export PATH="$HOME/code/Qt/5.1.1/clang_64/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

NETID="mjr78"
alias zoo="ssh -X ${NETID}@node.zoo.cs.yale.edu"
zoocp() {
  for dir; do true; done
  length=$(($#-1))
  array=${@:1:length}
  scp $array ${NETID}@node.zoo.cs.yale.edu:/home/accts/${NETID}/$dir
}
export PATH=/usr/local/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    . $HOME/.venvburrito/startup.sh
fi

# Lazy C++ (auto header file expansion, etc.)
alias lzz=$HOME'/code/personal/dotfiles/bin/lzz'

# Something weird about subl requires this....
rm ~/bin/subl
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl